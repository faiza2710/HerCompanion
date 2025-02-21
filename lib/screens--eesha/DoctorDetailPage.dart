import 'package:flutter/material.dart';

class DoctorDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Doctor", style: TextStyle(color: Colors.white)),
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
                    Icon(Icons.medical_services, size: 80, color: Colors.pink),
                    SizedBox(height: 10),
                    Text(
                      "Doctor",
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
                "As a Doctor, you will be responsible for diagnosing, treating, and preventing illnesses. You will provide medical advice to patients and perform surgeries or other medical procedures when necessary.",
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
                title: Text("Hospital B - New York"),
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
                "\$100,000 - \$250,000 per year",
                style: TextStyle(fontSize: 16, color: Colors.pink, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Required Skills",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.pink),
                title: Text("MD or DO degree"),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.pink),
                title: Text("Experience in patient care and surgeries"),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.pink),
                title: Text("Strong communication and analytical skills"),
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
