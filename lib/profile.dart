import 'package:flutter/material.dart';
import 'package:fyp/appbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String activeButton = 'Active';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SingleChildScrollView( // Added this to enable scrolling
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Allen George',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  Text(activeButton == 'Active' ? 'Active' : 'Away'),
                ],
              ),
              leading: Stack(
                clipBehavior: Clip.none, // Allows positioning of the green status outside the main container
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple.withOpacity(0.2),
                      border: Border.all(width: 1, color: Color(0xFF4A154B)),
                    ),
                    child: Icon(
                      Icons.person,
                      color: Color(0xFF4A154B),
                      size: 50,
                    ),
                  ),
                  Positioned(
                    top: 38, // Adjust as needed to position outside
                    left: 38, // Adjust as needed to position outside
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: activeButton == 'Active' ? Colors.green : Colors.grey,
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                child: ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add a profile photo',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Helping your teammates to know they\'re talking to the right person.',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  leading: Icon(Icons.camera_alt),
                ),
              ),
            ),
            SizedBox(height: 17),
            ElevatedButton(
              onPressed: () {
                print('Updating status...');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(width: 1, color: Color(0xFF4A154B)),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Row(
                  children: [
                    Icon(Icons.add_reaction_outlined, color: Color(0xFF4A154B)),
                    SizedBox(width: 17),
                    Text(
                      'Update your status',
                      style: TextStyle(
                          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 23),
            GestureDetector(
              onTap: () {
                print('notifications paused!');
              },
              child: Row(
                children: [
                  SizedBox(width: 5),
                  Icon(Icons.notifications_off_outlined, color: Colors.black),
                  SizedBox(width: 10),
                  Text('Pause notifications', style: TextStyle(fontSize: 17)),
                ],
              ),
            ),
            SizedBox(height: 23),
            GestureDetector(
              onTap: () {
                print('away set!');
                setState(() {
                  activeButton = activeButton == 'Active' ? 'Away' : 'Active';
                });
              },
              child: Row(
                children: [
                  SizedBox(width: 5),
                  if (activeButton == 'Active') ...[
                    Icon(Icons.person_off_outlined, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      'Set yourself as away',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                  if (activeButton == 'Away') ...[
                    Icon(Icons.person, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      'Set yourself as active',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(color: Colors.black26),
            SizedBox(height: 23),
            GestureDetector(
              onTap: () {
                print('Invitations to connect!');
              },
              child: Row(
                children: [
                  SizedBox(width: 5),
                  Icon(Icons.perm_contact_cal_outlined, color: Colors.black),
                  SizedBox(width: 10),
                  Text('Invitations to connect', style: TextStyle(fontSize: 17)),
                ],
              ),
            ),
            SizedBox(height: 23),
            GestureDetector(
              onTap: () {
                print('profile view');
              },
              child: Row(
                children: [
                  SizedBox(width: 5),
                  Icon(Icons.person, color: Colors.black),
                  SizedBox(width: 10),
                  Text('View Profile', style: TextStyle(fontSize: 17)),
                ],
              ),
            ),
            SizedBox(height: 23),
            GestureDetector(
              onTap: () {
                print('Notifications!');
              },
              child: Row(
                children: [
                  SizedBox(width: 5),
                  Icon(Icons.notifications_none, color: Colors.black),
                  SizedBox(width: 10),
                  Text('Notifications', style: TextStyle(fontSize: 17)),
                ],
              ),
            ),
            SizedBox(height: 23),
            GestureDetector(
              onTap: () {
                print('Preferences');
              },
              child: Row(
                children: [
                  SizedBox(width: 5),
                  Icon(Icons.settings, color: Colors.black),
                  SizedBox(width: 10),
                  Text('Preferences', style: TextStyle(fontSize: 17)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
