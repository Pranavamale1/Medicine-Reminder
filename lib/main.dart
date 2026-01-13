import 'package:flutter/material.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'controller/medicine_provider.dart';
import 'controller/notification_service.dart';
import 'view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  try {
    final timezoneInfo = await FlutterTimezone.getLocalTimezone();
    String timeZoneName = timezoneInfo.identifier;

    if (timeZoneName == "Asia/Calcutta") {
      timeZoneName = "Asia/Kolkata";
    }

    tz.setLocalLocation(tz.getLocation(timeZoneName));
    debugPrint("Timezone successfully initialized: $timeZoneName");
  } catch (e) {
    debugPrint("Timezone initialization failed, using fallback: $e");

    try {
      tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));
    } catch (e) {
      tz.setLocalLocation(tz.UTC);
    }
  }

  await NotificationService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MedicineProvider()..loadMedicines(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Medicine Reminder',
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.teal,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal,
            primary: Colors.teal,
            secondary: Colors.orange,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
