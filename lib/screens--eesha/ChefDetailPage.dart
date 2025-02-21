import 'package:flutter/material.dart';

class ChefDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Chef", style: TextStyle(color: Colors.white)),
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
                  Icon(Icons.restaurant, size: 80, color: Colors.pink),
                  SizedBox(height: 10),
                  Text(
                    "Chef",
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
              "As a Chef, you will be responsible for preparing delicious meals, creating unique recipes, and ensuring food quality in restaurants, hotels, or catering businesses.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              "Opportunities",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.business, color: Colors.pink),
              title: Text("Michelin Star Restaurant - Paris"),
            ),
            ListTile(
              leading: Icon(Icons.business, color: Colors.pink),
              title: Text("Luxury Hotel - New York"),
            ),
            ListTile(
              leading: Icon(Icons.business, color: Colors.pink),
              title: Text("Catering Services - London"),
            ),
            SizedBox(height: 15),
            Text(
              "Salary Range",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "\$40,000 - \$100,000 per year",
              style: TextStyle(fontSize: 16, color: Colors.pink, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              "Required Skills",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.check, color: Colors.pink),
              title: Text("Expertise in Cooking Techniques"),
            ),
            ListTile(
              leading: Icon(Icons.check, color: Colors.pink),
              title: Text("Creativity & Recipe Development"),
            ),
            ListTile(
              leading: Icon(Icons.check, color: Colors.pink),
              title: Text("Time Management & Multitasking"),
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
