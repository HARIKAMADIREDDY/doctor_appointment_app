import 'package:flutter/material.dart';
import 'booking_screen.dart';

class DoctorDetailScreen extends StatelessWidget {
  final Map<String, String> doctor;

  const DoctorDetailScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final name = doctor['name'] ?? 'Doctor';
    final specialty = doctor['specialty'] ?? 'Specialist';
    final image = doctor['image'] ?? '';
    final availability = doctor['availability'] ?? 'Not available';

    // Remove "Dr. " prefix for description readability
    final plainName = name.replaceFirst('Dr. ', '');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🩺 Profile Picture with border + shadow
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 65,
                backgroundColor: Colors.white,
                backgroundImage: image.isNotEmpty
                    ? (image.startsWith('assets/')
                    ? AssetImage(image)
                    : NetworkImage(image) as ImageProvider)
                    : const AssetImage('assets/images/default_doctor.png'),
              ),
            ),

            const SizedBox(height: 20),

            // 🧑‍⚕️ Doctor Name
            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 5),

            // 💊 Specialty
            Text(
              specialty,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 10),

            // ⭐ Ratings and Patients Info
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.star, color: Colors.amber, size: 20),
                SizedBox(width: 4),
                Text(
                  "4.8 ★",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 16),
                Icon(Icons.people_alt, color: Colors.blueAccent, size: 20),
                SizedBox(width: 4),
                Text(
                  "1200+ Patients",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // 📖 Short Description
            Text(
              "Dr. $plainName is a highly experienced ${specialty.toLowerCase()} known for compassionate care and accurate diagnosis.",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, height: 1.5),
            ),

            const SizedBox(height: 20),

            // 🕒 Availability Info
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blueAccent.withOpacity(0.4)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.access_time, color: Colors.blueAccent),
                  const SizedBox(width: 8),
                  Text(
                    availability,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // 🩹 Book Appointment Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookingScreen(doctor: doctor),
                    ),
                  );
                },
                icon: const Icon(Icons.calendar_today),
                label: const Text("Book Appointment"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadowColor: Colors.blueAccent.withOpacity(0.4),
                  elevation: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
