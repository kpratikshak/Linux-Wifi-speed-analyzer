## Linux Networking Project
# Wi-Fi Speed  Analyzer

🎯 Project Goal:

Build a CLI-based Wi-Fi speed, latency, signal strength & stability analyzer which

Runs on RHEL / Fedora / Rocky / AlmaLinux

Uses built-in Linux tools (nmcli, iw, ping, iperf3)

Generates logs + formatted reports

Can run manually, via cron, or systemd timer

Produces useful analytics for engineers

Features:

## 🎯 Features
- Signal strength monitoring
- Ping latency test
- iperf3 bandwidth performance
- Logs performance history
- Human readable reports
- Supports cron + systemd automation

---

## 🛠 Supported Platforms
- RHEL 8 / 9
- Rocky Linux
- AlmaLinux
- Fedora


## 🚀 Install
```bash
git clone https://github.com/kpratikshak/wifi-speed-analyzer.git
cd wifi-speed-analyzer
chmod +x setup.sh
./setup.sh
⚙️ Configure
nano config.conf

▶️ Run Tests
bash
Copy code
./analyzer.sh
📊 View Report
bash
Copy code
./report.sh
⏲ Automate (Optional)
bash
Copy code
sudo systemctl enable --now wifi-analyzer.timer

📌This project demonstrates:

Linux networking skills

Bash automation

Performance monitoring

Production-style logging

Systemd automation


#Features:
- Built an automated **Wi-Fi performance analytics tool** for RHEL using Bash & Linux networking utilities.
- Implemented **latency + throughput benchmarking** using `ping` and `iperf3`.
- Added **logging + analytics reporting** for trend monitoring.
- Enabled **automation via systemd timers** for scheduled diagnostics.


Automation script:
bash
sudo cp systemd/* /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now wifi-analyzer.timer
systemctl status wifi-analyzer.timer



⚙️ Parallel Testing
Use background jobs in bash:

Run ping
Run iperf


