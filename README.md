<h1 align="center">sysuu <sub>v0.2.0</sub></h1>

<p align="center">System update and upgrade automation</p>

---

## Table of Contents
- [About](#about)
- [Why](#why)
- [Requirements](#requirements)
- [Installation](#installation)
- [Future Improvements](#future-improvements)
- [Project Structure](#project-structure)

<h2 id="about">About</h2>

A utility script that automates routine system maintenance tasks, specifically `apt update` and `apt upgrade`. 

Instead of legacy cron jobs, it utilizes a native **Systemd Service and Timer architecture** to safely execute updates in the background.

```text
sysuu meaning
sys    - system
   u   - update
    u  - upgrade
```

<h2 id="why">Why?</h2>

I was tired of Ubuntu Desktop's live updates. Even though they are supposed to work in the background, I kept getting annoying system popups asking me to install new releases. A system should be upgraded daily to ensure the most secure version is running. 

As a student currently participating in a DevOps course focused heavily on automation, I thought my laptop workstation would be the perfect place to start. This project is the beginning of a collection of small scripts designed to automate those daily "must-do" tasks that every Linux user should perform.

<h2 id="requirements">Requirements</h2>

* Operating system based on Debian/Ubuntu (uses `apt`).
* systemd initialized as the system manager.
* Root/sudo privileges (required for system updates).

<h2 id="installation">Installation</h2>

### 1. Clone the Repository
First, clone this repository to your local machine (preferably into your home directory) and navigate into the project folder:
```bash
git clone https://github.com/Seysane/sysuu.git
cd ~/sysuu/scripts
```

### 2. Run the Installer

The project includes a fully automated `install.sh` script. It handles permissions, moves the executable into the global binary path, configures the Systemd units, and starts the automation timer.

Make the script executable:

```bash
chmod +x install.sh
```

Run the install.sh with sudo:

```bash
sudo ./install.sh
```

### 3. Verify the Automation

You can verify that your background timer is loaded and actively waiting for its next scheduled run by checking its system status:

```bash
sudo systemctl status sysuu.timer
```

To see a complete list of active timers and execution schedules on your machine:

```bash
systemctl list-timers
```

### 4. Logs Location

All execution reports and errors are saved chronologically at:

```text
/var/log/sysuu/
```

Filename format: `sysuuYYMMDD-HH.log`
```text
YY - Last two digits of current year
MM - Month
DD - Day
HH - Hour of execution
```

<h2 id="future-improvements">Future Improvements</h2>

This project is continuously evolving as I progress through system administration concepts:

[X] Replace cron with systemd services.

[x] Automated Installation Script: Create an install.sh script to deploy files and configure background tasks automatically.

[ ] Automated Cleanups: Integrate apt autoremove and apt clean to automatically purge obsolete packages and reclaim disk space.

[ ] Log Retention Policy: Implement a bash-driven retention mechanism (e.g., a 7-day limit) to automatically prune historical log files.

And more... Additional automation tweaks and optimizations are currently under consideration.

<h2 id="project-structure">Project Structure</h2>


```text
sysuu/             - Main directory
├── README.md      - Readme file
└── scripts/       - Script directory
    └── install.sh - Automated system installation script
```
