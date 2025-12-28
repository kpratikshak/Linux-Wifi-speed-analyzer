## Linux Networking Project
# Wi-Fi Speed  Analyzer

🎯 Project Goal:

Build a CLI-based Wi-Fi speed, latency, signal strength & stability analyzer that:

Runs on RHEL / Fedora / Rocky / AlmaLinux

Uses built-in Linux tools (nmcli, iw, ping, iperf3)

Generates logs + formatted reports

Can run manually, via cron, or systemd timer

Produces useful analytics for engineers


## Project Structure:

wifi-speed-analyzer/
│
├── analyzer.sh
├── config.conf
├── setup.sh
├── report.sh
├── README.md
├── logs/
│     └── wifi_stats.log
└── systemd/
      ├── wifi-analyzer.service
      └── wifi-analyzer.timer
