import 'package:flutter/material.dart';
import 'docotor_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> doctors = const [
    {
      "name": "Dr. Harika Reddy",
      "specialty": "Cardiologist",
      "image": "assets/images/doc1.png",
      "availability": "Mon–Fri, 10AM–5PM"
    },
    {
      "name": "Dr. Ramesh Kumar",
      "specialty": "Dermatologist",
      "image": "assets/images/doc2.png",
      "availability": "Tue–Sat, 11AM–6PM"
    },
    {
      "name": "Dr. Sneha Patel",
      "specialty": "Pediatrician",
      "image": "assets/images/doc3.png",
      "availability": "Mon–Thu, 9AM–4PM"
    },
    {
      "name": "Dr. Rajesh Sharma",
      "specialty": "Neurologist",
      "image": "assets/images/doc4.png",
      "availability": "Wed–Sun, 10AM–6PM"
    },
    {
      "name": "Dr. Priya Nair",
      "specialty": "Gynecologist",
      "image": "assets/images/doc5.png",
      "availability": "Mon–Fri, 9AM–3PM"
    },
    {
      "name": "Dr. Suresh Menon",
      "specialty": "Orthopedic Surgeon",
      "image": "assets/images/doc6.png",
      "availability": "Tue–Sat, 10AM–4PM"
    },
    {
      "name": "Dr. Kavya Iyer",
      "specialty": "Psychiatrist",
      "image": "assets/images/doc7.png",
      "availability": "Mon–Fri, 11AM–5PM"
    },
    {
      "name": "Dr. Manoj Bhat",
      "specialty": "Dentist",
      "image": "https://cdn-icons-png.flaticon.com/512/3774/3774268.png",
      "availability": "Mon–Sat, 9AM–6PM"
    },
    {
      "name": "Dr. Ananya Gupta",
      "specialty": "ENT Specialist",
      "image": "https://cdn-icons-png.flaticon.com/512/3774/3774297.png",
      "availability": "Mon–Fri, 10AM–5PM"
    },
    {
      "name": "Dr. Vivek Rao",
      "specialty": "General Physician",
      "image": "https://cdn-icons-png.flaticon.com/512/3774/3774255.png",
      "availability": "Tue–Sun, 9AM–3PM"
    },
    {
      "name": "Dr. Ritu Singh",
      "specialty": "Dermatologist",
      "image": "https://cdn-icons-png.flaticon.com/512/3774/3774252.png",
      "availability": "Mon–Thu, 11AM–7PM"
    },
    {
      "name": "Dr. Abhinav Das",
      "specialty": "Physiotherapist",
      "image": "https://cdn-icons-png.flaticon.com/512/3774/3774288.png",
      "availability": "Mon–Sat, 9AM–2PM"
    },
    {
      "name": "Dr. Meera Joshi",
      "specialty": "Ophthalmologist",
      "image": "https://cdn-icons-png.flaticon.com/512/3774/3774291.png",
      "availability": "Tue–Sat, 10AM–6PM"
    },
    {
      "name": "Dr. Arjun Varma",
      "specialty": "Oncologist",
      "image": "https://cdn-icons-png.flaticon.com/512/3774/3774262.png",
      "availability": "Mon–Fri, 9AM–5PM"
    },
    {
      "name": "Dr. Lakshmi Devi",
      "specialty": "Radiologist",
      "image": "https://cdn-icons-png.flaticon.com/512/3774/3774300.png",
      "availability": "Mon–Fri, 8AM–2PM"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.local_hospital, color: Colors.blueAccent, size: 22),
            SizedBox(width: 8),
            Text(
              "MyDoctor",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.blueAccent,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),


      body: Stack(
        children: [
          // ✅ Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_health.png', // add your bg image here
              fit: BoxFit.cover,
              color: Colors.white.withOpacity(0.2),
              colorBlendMode: BlendMode.lighten,
            ),
          ),

          // ✅ Motivational Quote
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '"Your Health, Our Priority" 💙',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // ✅ Doctor List
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 4,
                  shadowColor: Colors.blue.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: SizedBox(
                      height: 60,
                      width: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: doctor["image"]!.startsWith('assets/')
                            ? Image.asset(doctor["image"]!, fit: BoxFit.cover)
                            : Image.network(doctor["image"]!, fit: BoxFit.cover),
                      ),
                    ),
                    title: Text(
                      doctor["name"]!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      "${doctor["specialty"]}\n${doctor["availability"]}",
                      style: const TextStyle(height: 1.4),
                    ),
                    isThreeLine: true,
                    trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DoctorDetailScreen(doctor: doctor),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
