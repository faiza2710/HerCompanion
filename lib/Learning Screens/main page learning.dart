import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LearningScreen extends StatefulWidget {
  const LearningScreen({super.key});

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

final List<String> categories = [
  'Self Defense',
  'Cooking/Baking',
  'Household Problem Solving',
  'Beauty Tips',
  'Skill Development',
  'Mental Health',
  'Children Upbringing',
  'Pregnancy Care'
];

final List<String> imageList = [
  'https://img.freepik.com/free-photo/front-view-woman-with-sport-concept_23-2148499266.jpg?w=740',
  'https://img.freepik.com/free-photo/beautiful-young-woman-cooking-using-digital-tablet-kitchen_1301-7686.jpg?t=st=1739209650~exp=1739213250~hmac=32c9b8fcb57707b6ee3d26f7486d3a9930e1d29729025aa4d44ec64082646029&w=996',
  'https://img.freepik.com/free-photo/confuse-clueless-cute-girl-shrugging-looking-complicated_176420-30990.jpg?t=st=1739209595~exp=1739213195~hmac=ee260c958a73e9ac13437e80ffdfcd3722976322d188e64b60c4e2b0b9489188&w=996',
  'https://www.shutterstock.com/image-photo/beautiful-smiling-woman-long-wavy-600nw-1831638373.jpg',
  'https://img.freepik.com/premium-photo/skills-development-internet-technology-business_220873-3999.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgFnPqREWXtZv2ALKUCdIE8xE2ClR7ZmLROA&s',
  'https://www.shutterstock.com/image-photo/happy-loving-family-mother-her-600nw-557866771.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_s287tBbIn2OSjkbvVy5Y4Js00GzbqdN4NQ&s',
];

class _LearningScreenState extends State<LearningScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Column(
          children: [
            // Search Bar
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
                  hintText: 'Search learning category...',
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

            SizedBox(height: 10),

            // Learning Categories Grid
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.8,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle category tap
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          // Background Image
                          CachedNetworkImage(
                            imageUrl: imageList[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),

                          // Semi-transparent Overlay
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),

                          // Content
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Category Avatar
                                Align(
                                  alignment: Alignment.topRight,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: CachedNetworkImageProvider(imageList[index]),
                                    radius: 17,
                                  ),
                                ),

                                Spacer(),

                                // Category Name
                                Text(
                                  categories[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                Spacer(),

                                // Play Button
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    icon: Icon(Icons.play_arrow, color: Colors.white, size: 28),
                                    onPressed: () {
                                      // Handle Play button action
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
