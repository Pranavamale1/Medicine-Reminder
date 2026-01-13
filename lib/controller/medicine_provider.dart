import 'package:flutter/material.dart';
import 'package:medicine_reminder/models/medicine_db.dart';
import 'package:medicine_reminder/models/medicine_model.dart';
import 'notification_service.dart';

class MedicineProvider extends ChangeNotifier {
  List<Medicine> _medicines = [];
  List<Medicine> get medicines => _medicines;

  Future<void> loadMedicines() async {
    _medicines = await MedicineDB.instance.getAllMedicines();
    _sortByTime();
    notifyListeners();
  }

  Future<void> addMedicine(Medicine medicine) async {
    // 1. Database mein save karein aur ID lein
    final int id = await MedicineDB.instance.insertMedicine(medicine);
    await loadMedicines();

    try {
      final parts = medicine.time.split(":");
      final int hour = int.parse(parts[0]);
      final int minute = int.parse(parts[1]);

      final now = DateTime.now();

      DateTime scheduledDate = DateTime(
        now.year,
        now.month,
        now.day,
        hour,
        minute,
      );

      if (scheduledDate.isBefore(now)) {
        scheduledDate = scheduledDate.add(const Duration(days: 1));
        debugPrint(
          "Time nikal chuka tha, Next Day ke liye schedule kiya: $scheduledDate",
        );
      } else {
        debugPrint("Aaj ke liye schedule kiya: $scheduledDate");
      }

      await NotificationService().scheduleNotification(
        id: id,
        title: "💊 Medicine Reminder",
        body: "Waqt ho gaya hai: ${medicine.name} (${medicine.dose})",
        scheduledTime: scheduledDate,
      );
    } catch (e) {
      debugPrint("Notification scheduling failed: $e");
    }
  }

  Future<void> deleteMedicine(int id) async {
    await NotificationService().cancelNotification(id);
    await MedicineDB.instance.deleteMedicine(id);
    await loadMedicines();
  }

  void _sortByTime() {
    _medicines.sort((a, b) => a.time.compareTo(b.time));
  }
}
