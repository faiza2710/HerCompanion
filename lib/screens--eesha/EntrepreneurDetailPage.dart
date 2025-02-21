import 'package:flutter/material.dart';

class EntrepreneurDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Entrepreneur", style: TextStyle(color: Colors.white)),
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
                    Icon(Icons.business_center, size: 80, color: Colors.pink),
                    SizedBox(height: 10),
                    Text(
                      "Entrepreneur",
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
                "As an Entrepreneur, you will be responsible for creating, managing, and growing your own business ventures. You will need to be innovative, adaptable, and resourceful in developing new products or services and driving business success.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),
              Text(
                "Opportunities",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(Icons.business, color: Colors.pink),
                title: Text("Startup A - Remote"),
              ),
              ListTile(
                leading: Icon(Icons.business, color: Colors.pink),
                title: Text("Startup B - San Francisco"),
              ),
              ListTile(
                leading: Icon(Icons.business, color: Colors.pink),
                title: Text("Startup C - London"),
              ),
              SizedBox(height: 15),
              Text(
                "Salary Range",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$50,000 - \$150,000 per year",
                style: TextStyle(fontSize: 16, color: Colors.pink, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Required Skills",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.pink),
                title: Text("Strong business acumen"),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.pink),
                title: Text("Leadership and team management skills"),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.pink),
                title: Text("Ability to innovate and solve problems creatively"),
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
