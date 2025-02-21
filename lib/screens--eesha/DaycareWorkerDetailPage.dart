import 'package:flutter/material.dart';

class DaycareWorkerDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Daycare Worker", style: TextStyle(color: Colors.white)),
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
                  Icon(Icons.child_friendly, size: 80, color: Colors.pink),
                  SizedBox(height: 10),
                  Text(
                    "Daycare Worker",
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
              "As a Daycare Worker, you will care for children, ensure their safety, and create educational and fun activities for them.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              "Opportunities",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.business, color: Colors.pink),
              title: Text("Little Stars Daycare - Chicago"),
            ),
            ListTile(
              leading: Icon(Icons.business, color: Colors.pink),
              title: Text("Happy Kids Center - LA"),
            ),
            SizedBox(height: 15),
            Text(
              "Salary Range",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "\$25,000 - \$45,000 per year",
              style: TextStyle(fontSize: 16, color: Colors.pink, fontWeight: FontWeight.bold),
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
