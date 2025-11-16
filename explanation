# Flutter & Firebase Guide: Magic for Mobile Dev

Эта заметка расскажет, как настроить и использовать Flutter, Firebase и Android cmdline-tools на Windows и Ubuntu, а также для чего они нужны и как их правильно применять.

---

## Что это и зачем

- **Flutter** – кроссплатформенный фреймворк от Google для создания мобильных, веб и десктоп приложений на одном коде.
- **Firebase** – облачная платформа для приложений: база данных (Realtime/Firestore), аутентификация, хостинг, аналитика и многое другое.
- **Android cmdline-tools** – набор инструментов Android SDK, необходимых для сборки APK и работы с эмуляторами через командную строку.

---

## Установка на Windows

1. **Flutter**
   - Скачай [Flutter SDK](https://flutter.dev/docs/get-started/install/windows)
   - Добавь `flutter/bin` в `PATH`.
   - Проверь:  
     ```bash
     flutter doctor
     ```

2. **Android SDK (cmdline-tools)**
   - Установи Android Studio.
   - В Android Studio -> SDK Manager -> SDK Tools -> Command-line Tools.
   - Настрой `ANDROID_HOME` в системных переменных:
     ```
     ANDROID_HOME=C:\Users\<User>\AppData\Local\Android\Sdk
     PATH=%PATH%;%ANDROID_HOME%\cmdline-tools\latest\bin;%ANDROID_HOME%\platform-tools
     ```

3. **Firebase CLI**
   - Установи [Node.js](https://nodejs.org/)
   - В командной строке:
     ```bash
     npm install -g firebase-tools
     firebase login
     ```

4. **FlutterFire CLI**
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
## Установка на Ubuntu
Flutter
```
sudo snap install flutter --classic
flutter doctor
```
Android SDK (cmdline-tools)
```
mkdir -p ~/Android/Sdk/cmdline-tools
```
# скачай и распакуй с сайта Android
```
export ANDROID_HOME=~/Android/Sdk
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH
```
Firebase CLI
```
sudo npm install -g firebase-tools
firebase login
```
FlutterFire CLI
```
dart pub global activate flutterfire_cli
flutterfire configure
```
### Как правильно использовать
Храни секреты отдельно

Никогда не пушь service_account.json в репозиторий.

Используй .gitignore для локальных конфигов.

Сборка
```
flutter build apk --release
```
Инициализация Firebase

Создай проект через Firebase Console.

Сгенерируй firebase_options.dart через flutterfire configure.

Обновления

Регулярно обновляй Flutter, Firebase CLI и Android SDK для совместимости.

Документация

Flutter: [flutter.dev](https://flutter.dev/docs)

Firebase: [firebase.google.com](https://firebase.google.com/docs?hl=ru)

FlutterFire: [firebase.flutter.dev](https://firebase.flutter.dev/docs/overview/)

Советы:

Всегда проверяй flutter doctor.

Тестируй сборку на эмуляторе перед релизом.

Локально держи сервисные ключи и не загружай их в GitHub.
