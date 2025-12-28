#!/bin/bash

CONFIG_FILE="./config.conf"
LOG_FILE="./logs/wifi_stats.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

source $CONFIG_FILE

# Auto detect WiFi interface if empty
if [ -z "$WIFI_INTERFACE" ]; then
    WIFI_INTERFACE=$(nmcli device status | grep wifi | awk '{print $1}')
fi

echo "🔎 Running WiFi Diagnostics on $WIFI_INTERFACE"

SSID=$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\: -f2)
SIGNAL=$(iw dev $WIFI_INTERFACE link | grep signal | awk '{print $2}')
FREQ=$(iw dev $WIFI_INTERFACE link | grep freq | awk '{print $2}')
SPEED=$(iw dev $WIFI_INTERFACE link | grep bitrate | awk '{print $3, $4}')

echo "📶 Signal Strength: $SIGNAL dBm"
echo "🌐 SSID: $SSID"
echo "📡 Frequency: $FREQ MHz"
echo "⚡ Bitrate: $SPEED"

echo "🏓 Testing Latency..."
LATENCY=$(ping -c 4 $PING_HOST | tail -1| awk '{print $4}' | cut -d '/' -f 2)

echo "🚀 Testing Download Speed using iperf3..."
IPERF_RESULT=$(iperf3 -c $IPERF_SERVER -t $IPERF_TIME | grep sender | awk '{print $(NF-1)" "$(NF)}')

echo "$TIMESTAMP,$SSID,$SIGNAL,$LATENCY ms,$IPERF_RESULT,$SPEED MHz,$FREQ" >> $LOG_FILE

echo "✅ Test Complete — Logged to $LOG_FILE"
