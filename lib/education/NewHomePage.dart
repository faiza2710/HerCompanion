import 'package:flutter/material.dart';
import 'package:fyp/learning/main%20page%20learning.dart';
import 'package:fyp/education/explore_screen.dart';
import 'package:fyp/job/jobs_page.dart';

import '../community/Notification_Screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: Colors.pink,
        titleSpacing: 0, // Reduce default spacing
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust horizontal padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Her Companion',
                style: TextStyle(
                  fontFamily: 'CustomFont',
                  color: Colors.white,
                  fontSize: 30, // Slightly smaller font size for better alignment
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotificationScreen()),
                  );
                },
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelStyle: TextStyle(
            fontSize: 16, // Better font size balance
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.white60
          ),
          tabs: [
            Tab(text: 'Learning'),
            Tab(text: 'Explore'),
            Tab(text: 'Jobs'),

          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          LearningScreen(),
          ExploreScreen(),
          JobListScreen(),

        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
