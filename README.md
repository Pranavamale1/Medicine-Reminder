# 💊 Medicine Reminder Pro  
### A Smart, Offline-First Flutter Application for Daily Medication Management

**Medicine Reminder Pro** is a production-ready Flutter application built to help users manage their daily medicines with **automated reminders**, **clean architecture**, and a **modern medical UI**.  
This project was developed as a recruitment assignment to demonstrate real-world mobile app development skills.

---

## 🌟 What Does This App Do?

Medicine Reminder Pro ensures that users **never miss a dose** by:
- Scheduling medicines by time  
- Sending high-priority notifications  
- Storing all data securely on the device  
- Working completely offline  

It is designed for **reliability, simplicity, and clarity**.

---

## 🎨 UI & Design Principles

This app strictly follows professional medical UI standards:

🟢 **Primary Theme – Teal (`#008080`)**  
Used for AppBar, icons, and branding to give a clean and trustworthy healthcare feel.

🟠 **Accent Color – Orange (`#FFA500`)**  
Used for Call-to-Action buttons, focus borders, and interactive elements.

✨ **Modern Interface**  
- Rounded corners (15px)  
- Soft elevation effects  
- Animated input focus (Teal → Orange)  
- Clean, readable layouts  

---

## 🚀 Key Features

### ⏰ Smart Scheduling
- Medicines are **automatically sorted by time**.
- Upcoming doses always appear at the top.

### 📭 Empty State Handling
- Displays a clean placeholder screen when no medicines are added.

### 🔔 Reliable Notifications
- Works even when the app is **closed or in background**.
- Uses **Max Importance notifications** for visible alerts.
- Supports **timezone-accurate scheduling** using `timezone` and `flutter_timezone`.

### 💾 Offline Local Storage
- Uses **SQLite (SQFlite)** for persistent data.
- All data remains saved even after device reboot.
- **No internet or backend required.**

### 📝 Professional Forms
- Prevents empty or invalid submissions.
- Modern input fields with:
  - Helpful icons  
  - Clear hint texts  
  - Animated focus borders  

---

## 🏗️ Clean Architecture (MVC Pattern)

This project follows a strict **Model–View–Controller (MVC)** structure for scalability and maintainability:

🔹 **Models**  
Define the medicine structure and handle SQLite database operations.

🔹 **Views**  
All UI screens, reusable widgets, and theme styling.

🔹 **Controllers (Provider)**  
Manages business logic, database communication, and notification scheduling.

---

## 🛠️ Tech Stack

| Category | Technology |
|--------|------------|
Framework | Flutter (Latest Stable)  
State Management | Provider  
Database | SQFlite (SQLite)  
Notifications | Flutter Local Notifications  
Utilities | Timezone, Flutter Timezone, Path  
UI Design | Material 3  

---

## ⚙️ Installation & Setup

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/YOUR_USERNAME/medicine_reminder.git
2️⃣ Install Dependencies
bash
Copy code
flutter pub get
3️⃣ Run the App
Ensure an Android device (Emulator or Physical) is connected.

bash
Copy code
flutter run
