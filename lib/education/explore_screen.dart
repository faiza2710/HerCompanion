import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'LearningScreen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

final List<String> Categories = [
  'General Knowledge',
  'Science & Nature',
  'Sports',
  'Geography',
  'History',
  'Video Games',
  'Random'
];

final List<String> ImageList = [
  'https://play-lh.googleusercontent.com/7nZqAPEuWxAeckXC-lm1fWEk6pDK3mRlUCxPuLIctJ1MD9RM0HPgOdrhOwr39deWSjtn',
  'https://cdn-icons-png.flaticon.com/512/6747/6747064.png',
  'https://cdn-icons-png.freepik.com/256/5351/5351486.png?semt=ais_hybrid',
  'https://cdn-icons-png.flaticon.com/512/2784/2784487.png',
  'https://cdn-icons-png.flaticon.com/512/10089/10089731.png',
  'https://cdn-icons-png.flaticon.com/512/5260/5260498.png',
  'https://cdn-icons-png.flaticon.com/512/6662/6662916.png',
];

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                  children: [
                    TextSpan(
                      text: 'Her ',
                    ),
                    TextSpan(
                      text: 'Knowledge',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.pink,
                      ),
                    ),
                    TextSpan(
                      text: ' Hub',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: Categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Learningscreen(
                            category: Categories[index],
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: ImageList[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Opacity(
                              opacity: 0.3,
                              child: Container(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: CachedNetworkImageProvider(ImageList[index]),
                                    radius: 17,
                                  ),
                                ),
                                SizedBox(height: 30),
                                Text(
                                  Categories[index],
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Spacer(),
                                // Align(
                                //   alignment: Alignment.bottomRight,
                                //   child: IconButton(
                                //     icon: Icon(Icons.play_arrow, color: Colors.white),
                                //     onPressed: () {
                                //       Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //           builder: (context) => QuizScreen(category: Categories[index],),
                                //         ),
                                //       );
                                //     },
                                //   ),
                                // ),
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
