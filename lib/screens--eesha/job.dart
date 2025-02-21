import 'package:flutter/material.dart';

import 'BankingDetailPage.dart';
import 'BusinessAnalystDetailPage.dart';
import 'ChefDetailPage.dart';
import 'DaycareWorkerDetailPage.dart';
import 'DoctorDetailPage.dart';
import 'EntrepreneurDetailPage.dart';
import 'FashionDesignerDetailPage.dart';
import 'GraphicDesignerDetailPage.dart';
import 'JournalistDetailPage.dart';
import 'MakeupArtistDetailPage.dart';
import 'NurseDetailPage.dart';
import 'PhotographerDetailPage.dart';
import 'SoftwareEngineerDetailPage.dart';
import 'TeacherDetailPage.dart';

class JobsPage extends StatefulWidget {
  @override
  _JobsPageState createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  final List<Map<String, dynamic>> jobs = [
    {'icon': Icons.computer, 'title': 'Software Engineer','page': SoftwareEngineerDetailPage()},
    {'icon': Icons.business, 'title': 'Business Analyst','page': BusinessAnalystDetailPage()},
    {'icon': Icons.account_balance, 'title': 'Banking'   ,'page': BankingDetailPage()},
    {'icon': Icons.medical_services, 'title': 'Doctor'   ,'page': DoctorDetailPage()},
    {'icon': Icons.school, 'title': 'Teacher','page': TeacherDetailPage()},
    {'icon': Icons.palette, 'title': 'Fashion Designer','page': FashionDesignerDetailPage()},
    {'icon': Icons.design_services, 'title': 'Graphic Designer','page': GraphicDesignerDetailPage()},
    {'icon': Icons.local_hospital, 'title': 'Nurse','page': NurseDetailPage()},
    {'icon': Icons.store, 'title': 'Entrepreneur','page': EntrepreneurDetailPage()},
    {'icon': Icons.camera_alt, 'title': 'Photographer','page': PhotographerDetailPage()},
    {'icon': Icons.brush, 'title': 'Makeup Artist'  ,'page':MakeupArtistDetailPage()},
    {'icon': Icons.public, 'title': 'Journalist','page':JournalistDetailPage()},
    {'icon': Icons.child_friendly, 'title': 'Daycare Provider','page':DaycareWorkerDetailPage()},
    {'icon': Icons.food_bank, 'title': 'Chef','page':ChefDetailPage()},
  ];

  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.pink),
                hintText: 'Search jobs...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 3.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.0,
                ),
                itemCount: jobs.where((job) => job['title'].toLowerCase().contains(query)).length,
                itemBuilder: (context, index) {
                  final filteredJobs = jobs.where((job) => job['title'].toLowerCase().contains(query)).toList();

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => filteredJobs[index]['page'],
                        ),
                      );
                    },
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            filteredJobs[index]['icon'],
                            size: 50,
                            color: Colors.pink,
                          ),
                          SizedBox(height: 10),
                          Text(
                            filteredJobs[index]['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
