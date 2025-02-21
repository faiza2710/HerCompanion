import 'package:flutter/material.dart';

class NurseDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Nurse", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Icon(Icons.healing, size: 80, color: Colors.pink),
                    SizedBox(height: 10),
                    Text(
                      "Nurse",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Job Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "As a Nurse, you will be responsible for providing medical care, monitoring patients, and assisting doctors in healthcare facilities. You will be responsible for administering medications, assisting in surgeries, and ensuring that patients are comfortable and safe.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),
              Text(
                "Opportunities",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(Icons.business, color: Colors.pink),
                title: Text("Hospital A - Remote"),
              ),
              ListTile(
                leading: Icon(Icons.business, color: Colors.pink),
                title: Text("Hospital B - Los Angeles"),
              ),
              ListTile(
                leading: Icon(Icons.business, color: Colors.pink),
                title: Text("Hospital C - London"),
              ),
              SizedBox(height: 15),
              Text(
                "Salary Range",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$45,000 - \$90,000 per year",
                style: TextStyle(fontSize: 16, color: Colors.pink, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Required Skills",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.pink),
                title: Text("Registered Nurse (RN) License"),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.pink),
                title: Text("Knowledge of medical procedures and protocols"),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.pink),
                title: Text("Strong communication and empathy skills"),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add your apply action here
                  },
                  child: Text("Apply Now", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
