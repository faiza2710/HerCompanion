import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fyp/settings/About%20App%20Page.dart';
import 'package:fyp/settings/help%20and%20support%20page.dart';
import 'package:fyp/settings/privacy%20policy.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp/Auth/LoginPage.dart';

import 'Auth/ForgetPassword.dart';
import 'app_colors.dart';
import 'community/Notification_Screen.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  String _username = "";
  String _bio = "";

  @override
  void initState() {
    super.initState();
    _loadImageFromStorage();
    _loadUserProfile();
  }

  Future<void> _saveImage(File image) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/profile_image_${userId}_${DateTime.now().millisecondsSinceEpoch}.png';
    final savedImage = await image.copy(path);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image_path_$userId', savedImage.path);

    setState(() {
      _image = savedImage;
    });
  }

  Future<void> _loadImageFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    final path = prefs.getString('profile_image_path_$userId');
    if (path != null && path.isNotEmpty) {
      final file = File(path);
      final exists = await file.exists();
      if (exists) {
        setState(() {
          _image = file;
        });
      }
    }
  }

  Future<void> _loadUserProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    if (doc.exists) {
      final data = doc.data()!;
      setState(() {
        _username = data['username'] ?? "";
        _bio = data['bio'] ?? "";
      });
    }
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      await _saveImage(File(pickedFile.path));
    }
    Navigator.pop(context);
  }

  Future<void> _pickImageFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      await _saveImage(File(pickedFile.path));
    }
    Navigator.pop(context);
  }

  Future<void> _removeImage() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('profile_image_path_$userId');
    setState(() {
      _image = null;
    });
    Navigator.pop(context);
  }

  void _showImageOptions() {
    showModalBottomSheet(
      backgroundColor: Colors.pink,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: _image != null ? 220 : 180,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Upload photo', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: _pickImageFromGallery,
                  child: Row(children: [Icon(Icons.photo_album_outlined, color: Colors.white), SizedBox(width: 20), Text('View photo library', style: TextStyle(color: Colors.white))]),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: _pickImageFromCamera,
                  child: Row(children: [Icon(Icons.camera_alt_outlined, color: Colors.white), SizedBox(width: 20), Text('Take a photo', style: TextStyle(color: Colors.white))]),
                ),
                if (_image != null) ...[
                  SizedBox(height: 15),
                  InkWell(
                    onTap: _removeImage,
                    child: Row(children: [Icon(Icons.delete_outline, color: Colors.white), SizedBox(width: 20), Text('Remove current photo', style: TextStyle(color: Colors.white))]),
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }

  void _showEditProfileDialog() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    String? userId = currentUser?.uid;
    final _usernameController = TextEditingController(text: _username);
    final _bioController = TextEditingController(text: _bio);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            "Edit Profile",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.pink,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(color: secondaryColor),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _bioController,
                  decoration: InputDecoration(
                    labelText: "Bio",
                    labelStyle: TextStyle(color: secondaryColor),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final newUsername = _usernameController.text.trim();
                final newBio = _bioController.text.trim();

                if (newUsername.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red.shade100,
                      content: Text("Username cannot be empty.", style: TextStyle(color: Colors.black)),
                    ),
                  );
                  return;
                }

                if (userId == null) return;

                final querySnapshot = await FirebaseFirestore.instance
                    .collection('users')
                    .where('username', isEqualTo: newUsername)
                    .get();

                if (querySnapshot.docs.isNotEmpty && querySnapshot.docs.first.id != userId) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red.shade100,
                      content: Text("This username already exists. Please choose another.", style: TextStyle(color: Colors.black)),
                    ),
                  );
                  return;
                }

                await FirebaseFirestore.instance.collection('users').doc(userId).set({
                  'username': newUsername,
                  'bio': newBio,
                  'userId': userId,
                });

                if (mounted) {
                  setState(() {
                    _username = newUsername;
                    _bio = newBio;
                  });
                  Navigator.pop(context);
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: secondaryColor,
                foregroundColor: primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text("Save", style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(foregroundColor: primaryColor),
              child: Text("Cancel", style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: _showImageOptions,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: _image != null ? FileImage(_image!) : null,
                      backgroundColor: Colors.pink.withOpacity(0.3),
                      child: _image == null ? Icon(Icons.person, size: 40, color: Colors.white) : null,
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(_username.isNotEmpty ? _username : "username001", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          IconButton(icon: Icon(Icons.edit,color: secondaryColor,), onPressed: _showEditProfileDialog),
                        ],
                      ),
                      Text(_bio.isNotEmpty ? _bio : "Home sweet home 🏠", style: TextStyle(color: Colors.grey[600])),
                    ],
                  )
                ],
              ),
              Divider(height: 40,color: secondaryColor,),
              Text("Settings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListTile(
                leading: Icon(Icons.lock_outline),
                title: Text("Forgot Password"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ForgotPasswordPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications_outlined),
                title: Text("Notifications"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => NotificationScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip_outlined),
                title: Text("Privacy Policy"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PrivacyPolicyPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.help_outline),
                title: Text("Help & Support"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => HelpSupportPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text("About App"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AboutAppPage()));
                },
              ),

            ],
          ),
        ),
      ),
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
  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: secondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text("Logout", style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 18, color: primaryColor)),
        content: Text("Do you want to logout from the app?", style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: primaryColor)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(foregroundColor: primaryColor),
            child: Text("No", style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
            },
            style: TextButton.styleFrom(
              foregroundColor: secondaryColor,
              backgroundColor: primaryColor,
            ),
            child: Text("Yes", style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.pink,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Profile',
                style: TextStyle(
                  fontFamily: 'CustomFont',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () => _confirmLogout(context),
                child: const Text("Logout", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
