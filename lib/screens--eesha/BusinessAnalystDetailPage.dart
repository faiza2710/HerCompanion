import 'package:flutter/material.dart';

class BusinessAnalystDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Business Analyst", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(  // Wrap the body in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Icon(Icons.business, size: 80, color: Colors.pink),
                    SizedBox(height: 10),
                    Text(
                      "Business Analyst",
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
                "As a Business Analyst, you will work closely with stakeholders to analyze business needs, document requirements, and design solutions that drive business performance. You will play a key role in improving business processes and helping teams achieve goals.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),
              Text(
                "Opportunities",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(Icons.business, color: Colors.pink),
                title: Text("Company A - Remote"),
              ),
              ListTile(
                leading: Icon(Icons.business, color: Colors.pink),
                title: Text("Company B - New York"),
              ),
              ListTile(
                leading: Icon(Icons.business, color: Colors.pink),
                title: Text("Company C - London"),
              ),
              SizedBox(height: 15),
              Text(
                "Salary Range",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$55,000 - \$100,000 per year",
                style: TextStyle(fontSize: 16, color: Colors.pink, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Required Skills",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.pink),
                title: Text("Strong analytical and problem-solving skills"),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.pink),
                title: Text("Experience with Business Process Modeling (BPMN)"),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.pink),
                title: Text("Proficiency in data analysis tools (Excel, SQL, etc.)"),
              ),
              SizedBox(height: 20),  // Add some extra space before the button
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
