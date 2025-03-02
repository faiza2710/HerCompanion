import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fyp/learning/player.dart';

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
final List<String> playlists = [
  'PLbVdwtmx18suuF0meUSymnXvbc6yCtoQd&si=HjcajDpehIrCFeYg',
  'PLY14Itt9uf7tfMoG3Bw3f2nqKSJsAaAoP&si=4XGSG9dQRiSd1vCU',
  'PLkCV754f4ESVUs-PnGD8re8ukJAPOlcY-&si=003kYRjS6c6gAEEJ',
  'PLVdDKYcXHtGRFliCvM7MgGmOyfmAf4Pq0&si=VkqZlPg79SUFVy_8',
  'PLVdDKYcXHtGRYdGv5xsd0VZ71jZv9Sf3f&si=_YwkGtGZMPTQkqLE',
  'PLS-zsHAq4lsB95gfazal0UWaw5YoYk2xv&si=ZXpeVfjbHPJYrxC3',
  'PLsOTMkSSmsZN5FFyfVYOeOQ7R-NoROeVj&si=4yFJk2vgDiGo5uGQ',
  'PL1w5Qizk-osNCq-qJBAHjfb8s1SdVkx1N&si=A9yCJc7ywHebzOzL'
];
final List<String> imageList = [
  'assets/images/learning/self.jpg',
  'assets/images/learning/cook.jpeg',
  'assets/images/learning/solving.jpeg',
  'assets/images/learning/beauty.jpg',
  'assets/images/learning/skill.jpeg',
  'assets/images/learning/mental.jpeg',
  'assets/images/learning/child.webp',
  'assets/images/learning/pregenancy.jpeg',
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => YouTubeVideos(
                            playlistId: playlists[index], // Pass correct playlist ID
                            appBarTitle: categories[index], // Pass category name as title
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          // Background Image
                          Image.asset(
                            imageList[index],
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
                                    backgroundImage: AssetImage(imageList[index]),
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => YouTubeVideos(
                                            playlistId: playlists[index], // Pass correct playlist ID
                                            appBarTitle: categories[index], // Pass category name as title
                                          ),
                                        ),
                                      );
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
