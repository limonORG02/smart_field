#!/usr/bin/env bash
set -e

echo "=== Обновление системы ==="
sudo pacman -Syu --noconfirm

echo "=== Установка зависимостей ==="
sudo pacman -S --noconfirm git base-devel unzip curl wget

echo "=== Установка JDK и Android SDK tools ==="
sudo pacman -S --noconfirm jdk-openjdk android-sdk android-sdk-platform-tools android-udev

echo "=== Установка Flutter (snap alternative if available) ==="
if ! command -v flutter >/dev/null 2>&1; then
  git clone https://github.com/flutter/flutter.git --depth 1 /opt/flutter
  echo 'export PATH="/opt/flutter/bin:$PATH"' >> ~/.bashrc
  export PATH="/opt/flutter/bin:$PATH"
fi

echo "=== Установка Python и pip ==="
sudo pacman -S --noconfirm python python-pip

echo "=== Установка виртуального окружения ==="
python -m pip install --user virtualenv

echo "=== Установка зависимостей для MQTT bridge ==="
python -m pip install --user paho-mqtt firebase-admin

echo "=== Готово ==="

echo "После этого откройте новый терминал или выполните: source ~/.bashrc"
