#!/bin/bash

# === CONFIGURATION ===

INTERFACE="ens33"  # Change to ens33 if you're on VM bridged NIC
SUBNET="192.168.8.0/24"
KNOWN_DEVICES="known_devices.txt"
LOG_FILE="netwatch.log"
BOT_TOKEN="7322091438:AAEodJib5BvWyf4Ry6tNPn1z529mYg9Bc7U"
CHAT_ID="6520045497"

# === INIT ===

touch "$KNOWN_DEVICES"

LIVE_DEVICES=""
NEW_DEVICES=""
MISSING_DEVICES=""

# Run arp-scan
ARP_OUTPUT=$(sudo arp-scan --interface="$INTERFACE" "$SUBNET" 2>/dev/null)

# Extract Live MACs for tracking
LIVE_MACS=()

# === PROCESS SCAN RESULTS ===
while read -r line; do
    if [[ "$line" =~ ^([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)[[:space:]]+([0-9A-Fa-f:]{17})[[:space:]]+(.*)$ ]]; then
        IP="${BASH_REMATCH[1]}"
        MAC="${BASH_REMATCH[2]}"
        VENDOR="${BASH_REMATCH[3]}"

        HOST=$(host "$IP" 2>/dev/null | awk '/domain name pointer/ {print $5}' | sed 's/\.$//')
        [ -z "$HOST" ] && HOST="unknown"

        LIVE_MACS+=("$MAC")

        LIVE_DEVICES+="• IP: $IP
  MAC: $MAC
  Hostname: $HOST
  Vendor: $VENDOR

"

        if ! grep -iq "$MAC" "$KNOWN_DEVICES"; then
            NEW_DEVICES+="• IP: $IP
  MAC: $MAC
  Hostname: $HOST
  Vendor: $VENDOR

"
            echo "$(date) - NEW DEVICE CONNECTED: $IP $MAC $HOST $VENDOR" >> "$LOG_FILE"
            echo "$MAC" >> "$KNOWN_DEVICES"
        fi
    fi
done <<< "$(echo "$ARP_OUTPUT" | tail -n +3 | head -n -3)"

# === FIND DISCONNECTED DEVICES ===
while read -r MAC; do
    if ! printf '%s\n' "${LIVE_MACS[@]}" | grep -iq "$MAC"; then
        MISSING_DEVICES+="❌ *Previously Seen Device Not Connected*
MAC: $MAC

"
    fi
done < "$KNOWN_DEVICES"

# === COMPOSE MESSAGE ===
MESSAGE="📡 *Network Scan Report*

🟢 *Live Devices:*

$LIVE_DEVICES"

if [ -n "$NEW_DEVICES" ]; then
    MESSAGE+="
🔔 *New Devices Detected:*

$NEW_DEVICES"
fi

# === SEND TO TELEGRAM ===
curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
     -d chat_id="${CHAT_ID}" \
     --data-urlencode text="$MESSAGE" \
     -d parse_mode="Markdown"
