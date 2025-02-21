import 'package:flutter/material.dart';
import 'package:fyp/appbar.dart';
import 'package:fyp/main.dart';



class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    MyApp(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print('Selected Index: $_selectedIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 80.0,
        color: Color.fromRGBO(36, 46, 73, 1),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_sharp),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_camera_back_outlined),
              label: 'Videos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white, // Selected item color
          unselectedItemColor: Colors.white70, // Unselected item color
          onTap: _onItemTapped,
          backgroundColor:Colors.pink,
          selectedIconTheme: IconThemeData(
            size: 40,
          ),
          unselectedIconTheme: IconThemeData(
            size: 25,
          ),
        ),
      ),
    );
  }
}
