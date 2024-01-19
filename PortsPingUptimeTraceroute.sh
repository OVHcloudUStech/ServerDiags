#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <IP or hostname>"
    exit 1
fi

target="$1"

echo "Testing network connectivity to $target..."

# Check uptime
echo -n "Uptime: "
uptime

# Ping test
echo "Ping test:"
ping -c 5 "$target"

# Traceroute test
echo "Traceroute test:"
traceroute "$target"

# Port scanning
echo "Port scanning:"
for port in {1..65535}; do
    (echo >/dev/tcp/"$target"/"$port") >/dev/null 2>&1 && echo "$port open"
done
