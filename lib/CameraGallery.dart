import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraGalleryPicker extends StatefulWidget {
  @override
  _CameraGalleryPickerState createState() => _CameraGalleryPickerState();
}

class _CameraGalleryPickerState extends State<CameraGalleryPicker> {
  final ImagePicker _picker = ImagePicker();

  // Method to open the modal bottom sheet
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

  // Method to pick image from gallery or camera
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
      body: Center(
        child: ElevatedButton(
          onPressed: _showModalBottomSheet,
          child: Text('Open Modal Bottom Sheet'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',  // Add at least one more item to avoid the assertion error
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            _showModalBottomSheet();
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CameraGalleryPicker(),
  ));
}
