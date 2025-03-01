import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/services/services_firebase.dart';

class PostingService extends StatefulWidget {
  const PostingService({super.key});

  @override
  State<PostingService> createState() => _PostingServiceState();
}

class _PostingServiceState extends State<PostingService> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final FirebaseService firebaseService = FirebaseService(); // Firebase Service ka instance

  void saveService() async {
    String title = titleController.text.trim();
    String description = descriptionController.text.trim();
    String mobile = mobileController.text.trim(); // Trim spaces from start & end

    final RegExp mobileRegExp = RegExp(r'^\d{4} \d+$'); // 4 digits + space + more digits

    if (title.isEmpty || description.isEmpty || mobile.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    if (!mobileRegExp.hasMatch(mobile)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid mobile number (First 4 digits then space)')),
      );
      return;
    }

    try {
      await firebaseService.saveService(title, description, mobile);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Service Saved Successfully!')),
      );
      Navigator.pop(context); // Sirf jab data successfully save ho tab navigate karo
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save service. Please try again.')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provide Details', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              maxLength: 30,
              decoration: InputDecoration(
                labelText: 'Service Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Service Description',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),
            SizedBox(height: 16),

        TextField(
        controller: mobileController,
        keyboardType: TextInputType.phone,
        maxLength: 16, // 4 digits + 1 space + remaining digits
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          TextInputFormatter.withFunction((oldValue, newValue) {
            String digits = newValue.text.replaceAll(' ', ''); // Remove all spaces
            if (digits.length <= 4) {
              return TextEditingValue(
                text: digits,
                selection: TextSelection.collapsed(offset: digits.length),
              );
            } else {
              String formatted = digits.substring(0, 4) + ' ' + digits.substring(4);
              return TextEditingValue(
                text: formatted,
                selection: TextSelection.collapsed(offset: formatted.length),
              );
            }
          }),
        ],
        decoration: InputDecoration(
          labelText: 'Mobile Number (only digits)',
          border: OutlineInputBorder(),
        ),
      ),

      SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: saveService,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
