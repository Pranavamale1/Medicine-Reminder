import 'package:flutter/material.dart';
import 'package:medicine_reminder/models/medicine_model.dart';
import 'package:provider/provider.dart';

import '../controller/medicine_provider.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final _nameController = TextEditingController();
  final _doseController = TextEditingController();
  TimeOfDay? _selectedTime;

  void _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() => _selectedTime = time);
    }
  }

  void _saveMedicine() {
    if (_nameController.text.isEmpty ||
        _doseController.text.isEmpty ||
        _selectedTime == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return;
    }

    final time =
        "${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}";

    final medicine = Medicine(
      name: _nameController.text,
      dose: _doseController.text,
      time: time,
    );

    context.read<MedicineProvider>().addMedicine(medicine);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Medicine"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Medicine Name Field
            TextField(
              controller: _nameController,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                labelText: "Medicine Name",
                hintText: "e.g. Paracetamol",
                labelStyle: const TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
                hintStyle: TextStyle(color: Colors.grey[400]),
                prefixIcon: const Icon(
                  Icons.medication_liquid,
                  color: Colors.teal,
                ),
                filled: true,
                fillColor: Colors.teal.withOpacity(
                  0.05,
                ), // Light background color
                // Default Border
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.teal),
                ),

                // Focused Border (When user is typing)
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.orange,
                    width: 2,
                  ), // Orange Accent
                ),

                // Enabled Border (Normal State)
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.teal.withOpacity(0.5)),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Dose Field
            TextField(
              controller: _doseController,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                labelText: "Dose",
                hintText: "e.g. 500mg or 1 Tablet",
                labelStyle: const TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
                hintStyle: TextStyle(color: Colors.grey[400]),
                prefixIcon: const Icon(
                  Icons.monitor_weight_outlined,
                  color: Colors.teal,
                ),
                filled: true,
                fillColor: Colors.teal.withOpacity(0.05),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.teal),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.orange, width: 2),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.teal.withOpacity(0.5)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  _selectedTime == null
                      ? "No time selected"
                      : "Time: ${_selectedTime!.format(context)}",
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: _pickTime,
                  child: const Text("Pick Time"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: _saveMedicine,
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
