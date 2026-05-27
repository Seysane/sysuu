#!/bin/bash

VERSION="0.1.0"
LOG_DIR="/var/log/sysuu"
LOG_FILE="${LOG_DIR}/sysuu$(date +%y%m%d-%H).log"

[ ! -d "$LOG_DIR" ] && mkdir -p "$LOG_DIR"

echo "Starting sysuu v${VERSION} $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOG_FILE"
apt update && apt upgrade -y >> "$LOG_FILE" 2>&1
echo "System update and upgrade ended: $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOG_FILE"
