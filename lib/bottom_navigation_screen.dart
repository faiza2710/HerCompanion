import 'package:flutter/material.dart';
import 'package:fyp/Services.dart';
import 'package:fyp/education/NewHomePage.dart';
import 'package:fyp/sample.dart';
import 'package:image_picker/image_picker.dart';
import 'screens/home.dart';
import 'emergency_screens/EmergencyPage.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    HomePage(),
    TodoListPage(),
    Sample(),
    HomeServicesPage(),
    EmergencyPage(),
    // UserProfilePage(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      _showModalBottomSheet(); // Show the modal bottom sheet when the "add" button is tapped
    } else {
      setState(() {
        _selectedIndex = index;
        print('Selected Index: $_selectedIndex');
      });
    }
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.pink,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Upload photo',
                    style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    _pickImage(ImageSource.gallery); // Open the gallery
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.photo_album_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20),
                      Text('View photo library', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    _pickImage(ImageSource.camera); // Open the camera
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20),
                      Text('Take a photo', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      // You can process the picked image (e.g., display it or upload it)
      print('Picked image: ${pickedFile.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //appBar: CustomAppBar(),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 80.0,
        color: Color.fromRGBO(36, 46, 73, 1),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_sharp),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.checklist),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(3), // Add padding
                decoration: BoxDecoration(
                  color: Colors.white, // White background
                  //shape: BoxShape.circle, // Rounded borders
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.pink, // Icon color
                  size: 25, // Icon size
                ),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_repair_service_sharp),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white, // Selected item color
          unselectedItemColor: Colors.white70, // Unselected item color
          onTap: _onItemTapped,
          backgroundColor: Colors.pink,
          selectedIconTheme: IconThemeData(
            size: 30,
          ),
          unselectedIconTheme: IconThemeData(
            size: 25,
          ),
          showSelectedLabels: false, // Hide selected labels
          showUnselectedLabels: false, // Hide unselected labels
        ),
      ),
    );
  }
}
