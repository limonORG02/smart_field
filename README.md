### SmartField — IoT мониторинг полей в реальном времени

SmartField — это мобильное приложение и backend-bridge для мониторинга температуры, влажности и состояния растений (NDVI) в реальном времени. Данные поступают от IoT‑датчиков через MQTT и автоматически сохраняются в Firebase Firestore, после чего отображаются в Flutter-приложении.

Этот репозиторий полностью совместим с Arch Linux.

## Возможности

Приём данных от IoT‑датчиков через MQTT

Автоматическая запись данных в Firestore

Хранение истории измерений

Просмотр параметров поля в мобильном приложении (Flutter)

Простая архитектура для быстрого развёртывания

## Архитектура проекта
```
IoT Датчики → MQTT → Python Bridge → Firebase Firestore → Flutter App
```
## Структура репозитория
```
SmartField/
├── README.md
├── scripts/
│   ├── setup_arch.sh
│   └── run_mqtt_bridge.sh
├── backend/
│   ├── mqtt_to_firestore.py
│   └── service_account.json (не коммитить)
├── firebase/
│   └── firestore.rules
└── flutter_app/
    ├── pubspec.yaml
    ├── lib/main.dart
    └── lib/src/
        ├── models/sensor_data.dart
        ├── repositories/sensor_repository.dart
        ├── viewmodels/dashboard_viewmodel.dart
        └── ui/screens/dashboard_screen.dart
```

#### Установка на Arch Linux

1. Запуск автоматического скрипта
```
bash scripts/setup_arch.sh
```
2. Установка Firebase

Создайте проект → получите service_account.json → положите в backend/.

3. Запуск MQTT-бриджа
```
bash scripts/run_mqtt_bridge.sh
```
4. Запуск Flutter приложения
```
cd flutter_app
flutter pub get
flutter run
```
#### Установка на Ubuntu (22.04+)

1. Установка зависимостей
```
sudo apt update
sudo apt install -y git curl wget unzip python3 python3-pip openjdk-17-jdk
```
2. Установка Flutter
```
git clone https://github.com/flutter/flutter.git --depth 1 ~/flutter
echo 'export PATH="\$HOME/flutter/bin:\$PATH"' >> ~/.bashrc
source ~/.bashrc
```
3. Установка Android SDK
```
sudo apt install -y android-sdk
```
4. Установка зависимостей backend
```
pip3 install paho-mqtt firebase-admin
```
5. Запуск MQTT bridge
```
bash scripts/run_mqtt_bridge.sh
```
6. Запуск Flutter
```
cd flutter_app
flutter pub get
flutter run
```
#### Установка на Windows 10/11

1. Установка Flutter

Скачать с сайта Flutter → распаковать → добавить путь flutter/bin в PATH.

2. Установка Python и пакетов

Установить Python с официального сайта, затем:
```
pip install paho-mqtt firebase-admin
```
3. Установка Android Studio

– скачайте Android Studio– установите Android SDK + platform‑tools

4. Запуск MQTT bridge
```
python backend/mqtt_to_firestore.py
```
5. Запуск Flutter приложения
```
cd flutter_app
flutter pub get
flutter run

cd flutter_app
flutter pub get
flutter run
```


### Пример MQTT сообщения
```
{
  "temperature": 22.4,
  "humidity": 48.1,
  "ndvi": 0.71,
  "timestamp": 1700000000
}
```
Отправляется в топик: sensor/<field_id>/data.

### Firestore структура
```
sensors/
  field_1/
    readings/
      autoId: {
        temperature: 22.4,
        humidity: 48.1,
        ndvi: 0.71,
        timestamp: ...
      }
```
