#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/.."

# activate venv if you use one
# source venv/bin/activate

nohup python backend/mqtt_to_firestore.py > mqtt_bridge.log 2>&1 &

echo "MQTT -> Firestore bridge запущен (лог: mqtt_bridge.log)"
