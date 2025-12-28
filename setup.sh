#!/bin/bash

LOG_DIR="./logs"
mkdir -p $LOG_DIR

echo "🔍 Checking dependencies..."

REQ_PKGS=(nmcli iw iperf3 curl)

for pkg in "${REQ_PKGS[@]}"; do
    if ! command -v $pkg &> /dev/null
    then
        echo "⚠️ $pkg not found. Installing..."
        sudo dnf install -y $pkg || sudo yum install -y $pkg
    else
        echo "✅ $pkg installed"
    fi
done

echo "📂 Ensuring permissions..."
chmod +x analyzer.sh report.sh

echo "✅ Setup Complete!"
