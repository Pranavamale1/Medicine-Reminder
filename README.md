💊 Medicine Reminder Pro

A high-performance, production-ready Flutter application designed for medication tracking and automated reminders. This project demonstrates a robust implementation of the MVC (Model-View-Controller) pattern, persistent local storage, and background task scheduling.

🎨 Design System & Constraints
Adhering strictly to the recruitment design guidelines:

Primary Palette: Teal (#008080) – Utilized for branding, AppBars, and active states to maintain a professional medical aesthetic.

Accent Palette: Orange (#FFA500) – Strategically used for Call-to-Action (CTA) buttons, input focus states, and interactive feedback.

Modern UI: Integrated rounded corners (15px), elevated surface cards, and custom-styled input fields with dynamic teal-to-orange border transitions.

🚀 Key Features
1. Smart Scheduling Engine
   
Chronological Sorting: Automatically sorts medication lists by time, ensuring that the most immediate doses are always at the top.

Intelligent Logic: If a user schedules a time that has already passed for the current day, the system automatically reschedules the alarm for the following day.


2. Robust Alarm System
   
Background Alerts: Notifications are delivered reliably even if the app is minimized or killed, powered by flutter_local_notifications.

High-Priority Channels: Configured with "Max Importance" to ensure heads-up alerts on modern Android devices.

Timezone Synchronization: Integrated with timezone and flutter_timezone to maintain schedule integrity across global regions.

3. Data Persistence & Architecture
   
Offline First: Uses SQFlite for a local-first SQL database architecture.

State Management: Powered by Provider, ensuring a clean separation between business logic and UI updates.

Clean Logs: Implements professional debugPrint logging for database operations and scheduling status to aid enterprise-level debugging.

🏗️ Technical Architecture (MVC)

The project is organized to ensure modularity and scalability:

Models: Defines the Medicine entity and manages the SQLite database (MedicineDB).

Views: Contains the UI layer, including screens, reusable styled widgets, and custom theme data.

Controllers (Provider): The MedicineProvider acts as the brain, coordinating between the database, the notification engine, and the UI.

🛠️ Tech Stack & Dependencies

Core: Flutter (Latest Stable)

State Management: Provider

Local Storage: SQFlite

Notifications: Flutter Local Notifications

Utilities: Timezone, Flutter Timezone, Path

Logging: Professional structured debug printing.

⚙️ Installation & Deployment
Clone the Repository:

Bash

git clone https://github.com/Pranavamale1/medicine_reminder_app.git
Install Dependencies:

Bash

flutter pub get

Generate Release Build:
Bash

flutter build apk --release

📝 Developer Information

This application was developed as a comprehensive recruitment assignment to showcase expertise in:

Clean Architecture & Code Separation.

Native Android Alarm/Notification Integration.

Persistent Data Management.

Strict adherence to provided UI/UX constraints.
