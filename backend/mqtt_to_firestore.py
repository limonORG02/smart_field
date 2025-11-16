#!/usr/bin/env python3
import json
import os
import time
from datetime import datetime

import paho.mqtt.client as mqtt
import firebase_admin
from firebase_admin import credentials, firestore

# Настройки
MQTT_BROKER = os.environ.get('MQTT_BROKER', 'localhost')
MQTT_PORT = int(os.environ.get('MQTT_PORT', '1883'))
MQTT_TOPIC = os.environ.get('MQTT_TOPIC', 'sensor/+/data')

SERVICE_ACCOUNT = os.environ.get('GOOGLE_APPLICATION_CREDENTIALS', 'backend/service_account.json')

# Инициализация Firebase Admin
if not os.path.exists(SERVICE_ACCOUNT):
    raise SystemExit('Ошибка: файл сервис-аккаунта Firebase не найден: {}'.format(SERVICE_ACCOUNT))
cred = credentials.Certificate(SERVICE_ACCOUNT)
firebase_admin.initialize_app(cred)
db = firestore.client()

# Обработчик входящих сообщений

def on_connect(client, userdata, flags, rc):
    print('Connected to MQTT broker, rc=', rc)
    client.subscribe(MQTT_TOPIC)


def on_message(client, userdata, msg):
    try:
        payload = msg.payload.decode('utf-8')
        data = json.loads(payload)
    except Exception as e:
        print('Ошибка парсинга сообщения:', e)
        return

    # Топик вида sensor/{field_id}/data
    parts = msg.topic.split('/')
    field_id = parts[1] if len(parts) > 1 else 'unknown'

    timestamp = data.get('timestamp') or int(time.time())
    if isinstance(timestamp, str):
        try:
            timestamp = int(timestamp)
        except:
            timestamp = int(time.time())

    doc = {
        'temperature': data.get('temperature'),
        'humidity': data.get('humidity'),
        'ndvi': data.get('ndvi'),
        'raw': data,
        'timestamp': firestore.SERVER_TIMESTAMP if timestamp is None else datetime.utcfromtimestamp(int(timestamp))
    }

    # Сохраняем в коллекцию sensors/<field_id>/readings
    try:
        col_ref = db.collection('sensors').document(field_id).collection('readings')
        col_ref.add(doc)
        print(f'[{datetime.utcnow().isoformat()}] Saved reading for {field_id}:', doc)
    except Exception as e:
        print('Ошибка записи в Firestore:', e)


if __name__ == '__main__':
    client = mqtt.Client()
    client.on_connect = on_connect
    client.on_message = on_message

    print('Connecting to MQTT broker', MQTT_BROKER, MQTT_PORT)
    client.connect(MQTT_BROKER, MQTT_PORT, 60)
    client.loop_forever()
