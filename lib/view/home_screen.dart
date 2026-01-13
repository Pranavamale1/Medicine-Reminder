import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/medicine_provider.dart';
import 'add_medicine_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MedicineProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Medicine Reminder"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddMedicineScreen()),
          );
        },
      ),
      body: provider.medicines.isEmpty
          ? const Center(child: Text("No medicines added yet"))
          : ListView.builder(
              itemCount: provider.medicines.length,
              itemBuilder: (context, index) {
                final med = provider.medicines[index];
                return ListTile(
                  title: Text(med.name),
                  subtitle: Text("${med.dose} at ${med.time}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => context
                        .read<MedicineProvider>()
                        .deleteMedicine(med.id!),
                  ),
                );
              },
            ),
    );
  }
}
