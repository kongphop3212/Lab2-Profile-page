// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:lab1/student.dart';

class DetailPage extends StatelessWidget {
  final Student data;

  const DetailPage({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Detail Page"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: "image_profile_${data.name}",
                  child: ClipOval(
                    child: Image(
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                      image: AssetImage(data.image),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  data.name,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 20),
                buildDetailCard(Icons.email, "Email", data.email,
                    width: 300.0), // กำหนดความกว้างเป็น 300 พิกเซล
                buildDetailCard(Icons.cake, "Date of Birth", data.dateOfBirth,
                    width: 300.0),
                buildDetailCard(Icons.phone, "Phone Number", data.phoneNumber,
                    width: 300.0),
                buildDetailCard(Icons.info, "About Me", data.aboutMe,
                    width: 300.0),
                buildDetailCard(
                    Icons.link, "Social Media", data.socialMediaLink,
                    width: 300.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetailCard(IconData icon, String title, String value,
      {required double width}) {
    return Container(
      width: width,
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.blueAccent),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$title: ",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}