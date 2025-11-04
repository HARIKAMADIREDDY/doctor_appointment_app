import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart'; // For date formatting

class BookingScreen extends StatefulWidget {
  final Map<String, String> doctor;

  const BookingScreen({super.key, required this.doctor});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final TextEditingController _nameController = TextEditingController();

  Future<void> _saveBooking() async {
    if (!_formKey.currentState!.validate()) return;

    if (selectedDate == null || selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select both date and time")),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("doctorName", widget.doctor["name"]!);
    await prefs.setString("patientName", _nameController.text);
    await prefs.setString("date", DateFormat('yMMMd').format(selectedDate!));
    await prefs.setString("time", selectedTime!.format(context));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Appointment booked with ${widget.doctor["name"]}!"),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pop(context);
    Navigator.pop(context);
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null) setState(() => selectedDate = picked);
  }

  Future<void> _pickTime() async {
    final TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) setState(() => selectedTime = picked);
  }

  @override
  Widget build(BuildContext context) {
    final doctorName = widget.doctor["name"] ?? "Doctor";

    return Scaffold(
      appBar: AppBar(
        title: Text("Book $doctorName"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Patient name field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Patient Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? "Enter your name" : null,
              ),

              const SizedBox(height: 20),

              // Date picker
              ListTile(
                tileColor: Colors.blue.shade50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: Text(
                  selectedDate == null
                      ? "Select Appointment Date"
                      : "Date: ${DateFormat('EEEE, MMM d, yyyy').format(selectedDate!)}",
                ),
                trailing: const Icon(Icons.calendar_today, color: Colors.blue),
                onTap: _pickDate,
              ),

              const SizedBox(height: 12),

              // Time picker
              ListTile(
                tileColor: Colors.blue.shade50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: Text(
                  selectedTime == null
                      ? "Select Appointment Time"
                      : "Time: ${selectedTime!.format(context)}",
                ),
                trailing: const Icon(Icons.access_time, color: Colors.blue),
                onTap: _pickTime,
              ),

              const SizedBox(height: 30),

              // Confirm button
              ElevatedButton.icon(
                onPressed: _saveBooking,
                icon: const Icon(Icons.check_circle),
                label: const Text("Confirm Booking"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
