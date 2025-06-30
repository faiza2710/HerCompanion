import 'package:flutter/material.dart';
import '../app_colors.dart'; // Adjust the path if needed

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text(
          "About This App",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 4,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Logo image here
                Center(
                  child: Image.asset(
                    'assets/images/logo.png', // 🔁 Replace with your logo path
                    height: 100,
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    "Her Companion",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: Colors.grey),
                SizedBox(height: 10),
                Text(
                  "Version:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("1.0.0"),
                SizedBox(height: 12),
                Text(
                  "About:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Her Companion is a community-driven app designed to support, empower, and connect women. It brings together educational content, self-care tools, household management, job search, and community support into one place.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(height: 1.5),
                ),
                SizedBox(height: 12),
                Text(
                  "Technologies Used:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Flutter, Firebase Firestore, Firebase Auth, Firebase Storage"),
                SizedBox(height: 12),
                Text(
                  "Purpose:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "To help women lead more organized, confident, and fulfilling lives — whether managing a household, learning new skills, or finding support through community.",
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
