<h1 align="center">sysuu <sub>v0.1.0</sub></h1>

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

A script that automates routine system maintenance tasks, specifically

`apt update` and `apt upgrade`.

It runs automatically in the background using CRON.

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
* `cron` or `anacron` service installed and running.
* Root/sudo privileges (required for system updates).

<h2 id="installation">Installation</h2>

### 1. Clone the Repository
First, clone this repository to your local machine (preferably into your home directory) and navigate into the project folder:
```bash
git clone https://github.com/Seysane/sysuu.git
cd ~/sysuu
```

### 2. Permissions

Make the script executable before scheduling it:

```bash
chmod +x scripts/sysuu.sh
```

### 3. Schedule with Cron

Since `apt` requires superuser privileges, the script must be added to the root crontab.

Open the root crontab:

```bash
sudo crontab -e
```

Add the following line at the very bottom (remember to adjust the path to your system's username):

```text
0 */6 * * * /home/your-user-name/sysuu/scripts/sysuu.sh
```

>Tip: This configuration runs the script every 6 hours. 
>
>If you want to change the interval (e.g., to run daily or weekly), you can easily generate a new cron schedule using `crontab.guru`.

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

This project is a work in progress. Here are the specific features and system maintenance tasks I plan to implement next:

- [ ] Automated Cleanups: Add `apt autoremove` and `apt clean` to automatically purge obsolete packages and free up disk space.

- [ ] Log Retention Policy: Implement a retention mechanism (e.g., a configurable 7-day limit) to automatically delete historical log files older than a specific number of days.

- [ ] Automated Installation Script: Create an `install.sh` script to automate the setup process (checking dependencies, granting execute permissions, and automatically scheduling the root Cron job without manual crontab editing).

And more... Additional automation tweaks and optimizations are currently under consideration.

<h2 id="project-structure">Project Structure</h2>


```text
sysuu/             - Main directory
├── README.md      - Readme file
└── scripts/       - Script directory
    └── sysuu.sh   - Script
```
