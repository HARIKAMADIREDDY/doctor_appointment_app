import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const DoctorBookingApp());
}

class DoctorBookingApp extends StatelessWidget {
  const DoctorBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Booking App',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
