import 'package:flutter/material.dart';

class JournalistDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Journalist", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Icon(Icons.public, size: 80, color: Colors.pink),
                  SizedBox(height: 10),
                  Text(
                    "Journalist",
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
              "As a Journalist, you will research, write, and report news stories to inform the public. You may work for newspapers, TV, or online media.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              "Opportunities",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.business, color: Colors.pink),
              title: Text("News Channel - BBC"),
            ),
            ListTile(
              leading: Icon(Icons.business, color: Colors.pink),
              title: Text("Online Media - Huffington Post"),
            ),
            SizedBox(height: 15),
            Text(
              "Salary Range",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "\$40,000 - \$90,000 per year",
              style: TextStyle(fontSize: 16, color: Colors.pink, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              "Required Skills",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.check, color: Colors.pink),
              title: Text("Excellent Writing & Research Skills"),
            ),
            ListTile(
              leading: Icon(Icons.check, color: Colors.pink),
              title: Text("Strong Communication & Interviewing"),
            ),
            ListTile(
              leading: Icon(Icons.check, color: Colors.pink),
              title: Text("Adaptability & Ethical Journalism"),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
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
    );
  }
}
