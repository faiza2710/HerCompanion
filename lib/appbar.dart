import 'package:flutter/material.dart';
import 'package:fyp/emergency_screens/EmergencyPage.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Colors.pink,
      flexibleSpace: Stack(
        children: [
          // Logo and title on the left
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Her Companion',
                    style: TextStyle(
                      fontFamily: 'CustomFont', // The font family name as defined in pubspec.yaml
                      color: Colors.white,
                      fontSize: 30, // Slightly larger font size for cursive styling
                      fontWeight: FontWeight.w500, // Adjust weight if needed
                    ),
                  ),
                  // Favorite Icon with Red Dot
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EmergencyPage()),
                          );
                        },
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      // Positioned(
                      //   top: 11,
                      //   right: 12,
                      //   child: Container(
                      //     width: 10,
                      //     height: 10,
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       shape: BoxShape.circle,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
