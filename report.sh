#!/bin/bash

LOG_FILE="./logs/wifi_stats.log"

if [ ! -f "$LOG_FILE" ]; then
  echo "❌ No logs found!"
  exit 1
fi

echo "============================"
echo " 📡 WiFi Analyzer Summary"
echo "============================"

tail -10 $LOG_FILE | awk -F',' '
{
print "\nTimestamp: "$1
print "SSID: "$2
print "Signal Strength: "$3" dBm"
print "Latency: "$4
print "Speed: "$5
}
'
