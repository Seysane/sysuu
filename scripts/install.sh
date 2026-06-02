#!/bin/bash

#  Permission check
if [ "$EUID" -ne 0 ]; then
  echo "Execute this script as root: sudo ./install.sh"
  exit 1
fi

echo "Installing sysuu service..."

#  Creating sysuu
cat << 'EOF' > /usr/local/bin/sysuu
#!/bin/bash

VERSION="0.2.0"
LOG_DIR="/var/log/sysuu"
LOG_FILE="${LOG_DIR}/sysuu$(date +%y%m%d-%H).log"

[ ! -d "$LOG_DIR" ] && mkdir -p "$LOG_DIR"

echo "Starting sysuu v${VERSION} $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOG_FILE"
apt update && apt upgrade -y >> "$LOG_FILE" 2>&1
echo "System update and upgrade ended: $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOG_FILE"
EOF

chmod +x /usr/local/bin/sysuu

#  Creating sysuu.service
cat << 'EOF' > /etc/systemd/system/sysuu.service
[Unit]
Description=Automated system update and upgrade using sysuu script
After=network-online.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/sysuu
EOF

echo "Systemd sysuu service installation completed."

#  Creaing sysuu.timer
cat << 'EOF' > /etc/systemd/system/sysuu.timer
[Unit]
Description=Run sysuu script automatically every 12 hours

[Timer]
OnCalendar=*-*-* 00,12:00:00
Persistent=true

[Install]
WantedBy=timers.target
EOF

#  Service reload and start

systemctl daemon-reload
systemctl enable --now sysuu.timer
