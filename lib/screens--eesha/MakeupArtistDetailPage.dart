import 'package:flutter/material.dart';

class MakeupArtistDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Makeup Artist", style: TextStyle(color: Colors.white)),
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
                  Icon(Icons.brush, size: 80, color: Colors.pink),
                  SizedBox(height: 10),
                  Text(
                    "Makeup Artist",
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
              "As a Makeup Artist, you will enhance facial aesthetics through makeup application, work with clients for special events, and stay updated on beauty trends.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              "Opportunities",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.business, color: Colors.pink),
              title: Text("Beauty Salon - New York"),
            ),
            ListTile(
              leading: Icon(Icons.business, color: Colors.pink),
              title: Text("Fashion Industry - Paris"),
            ),
            SizedBox(height: 15),
            Text(
              "Salary Range",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "\$30,000 - \$70,000 per year",
              style: TextStyle(fontSize: 16, color: Colors.pink, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              "Required Skills",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.check, color: Colors.pink),
              title: Text("Proficiency in Makeup Techniques"),
            ),
            ListTile(
              leading: Icon(Icons.check, color: Colors.pink),
              title: Text("Knowledge of Skin Types & Products"),
            ),
            ListTile(
              leading: Icon(Icons.check, color: Colors.pink),
              title: Text("Creativity & Attention to Detail"),
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
