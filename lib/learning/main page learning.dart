import 'dart:ui';
import 'package:flutter/material.dart';
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
  'Skill Development',
  'Mental Health',
  'Children Upbringing',
  'Pregnancy Care',
  'Beauty Tips'
];
final List<String> playlists = [
  'PLUKrZ9evwtjzOG167Guij4xSaKz44TfdL',
  'PLqbUw5kmg6AE7mooU4WfFKcMJK7gxyxjz',
  'PLgyCqOhJ6dtVTs4FPZChXv5GShJ9q9i2r',
  'PL9RcWoqXmzaLt7FMmdDK8SoM5X63cPytf',
  'PLazcP3-djRZ0TedxFwLW8A4u3wFyQnWI8',
  'PLwyTRZcroHza9RfvQdMBIVYN1Trn_fcGN',
  'PLtKrpSPklixjhuPYDQ6UkIF_LD5GpzDqU',
  'PLrzQ1NmPAm_ZRiYQj2w10eerIFCRHtcJZ',
];
final List<String> imageList = [
  'assets/images/learning/self.jpg',
  'assets/images/learning/cook.jpeg',
  'assets/images/learning/solving.jpeg',
  'assets/images/learning/skill.jpeg',
  'assets/images/learning/mental.jpeg',
  'assets/images/learning/child.webp',
  'assets/images/learning/pregenancy.jpeg',
  'assets/images/learning/beauty.jpg',
];

class _LearningScreenState extends State<LearningScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    // Filtered list jo sirf matching categories dikhayegi
    List<int> filteredIndexes = [];
    for (int i = 0; i < categories.length; i++) {
      if (categories[i].toLowerCase().contains(query)) {
        filteredIndexes.add(i);
      }
    }

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
                padding: EdgeInsets.all(12.0), // increased padding
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0, // more horizontal spacing
                  mainAxisSpacing: 12.0,  // more vertical spacing
                  childAspectRatio: 1.0,  // increase to make items shorter
                ),
                itemCount: filteredIndexes.length,
                itemBuilder: (context, index) {
                  int originalIndex = filteredIndexes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => YouTubeVideos(
                            playlistId: playlists[originalIndex],
                            appBarTitle: categories[originalIndex],
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          Image.asset(
                            imageList[originalIndex],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(imageList[originalIndex]),
                                    radius: 17,
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      categories[originalIndex],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),

                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    icon: Icon(Icons.play_arrow, color: Colors.white, size: 28),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => YouTubeVideos(
                                            playlistId: playlists[originalIndex],
                                            appBarTitle: categories[originalIndex],
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

