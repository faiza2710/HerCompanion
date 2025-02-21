import 'package:flutter/material.dart';
import 'package:fyp/Learning%20Screens/main%20page%20learning.dart';
import 'package:fyp/education/explore_screen.dart';
import 'package:fyp/screens--eesha/job.dart';

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
                  fontSize: 24, // Slightly smaller font size for better alignment
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Favorite button action
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
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.black
          ),
          tabs: [
            Tab(text: 'Explore'),
            Tab(text: 'Jobs'),
            Tab(text: 'Learning'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ExploreScreen(),
          JobsPage(),
          LearningScreen(),
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
