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
  final FirebaseService firebaseService = FirebaseService();

  final RegExp onlyDigits = RegExp(r'^\d+$');
  final RegExp containsLetters = RegExp(r'[a-zA-Z]');

  void saveService() async {
    String title = titleController.text.trim();
    String description = descriptionController.text.trim();
    String mobile = mobileController.text.trim();

    final RegExp mobileRegExp = RegExp(r'^\d{4} \d{7,}$');

    if (title.isEmpty || description.isEmpty || mobile.isEmpty) {
      showError("All fields are required.");
      return;
    }

    if (!containsLetters.hasMatch(title) ||
        onlyDigits.hasMatch(title) ||
        isGibberish(title)) {
      showError("Enter a meaningful service title.");
      return;
    }

    if (description.length < 10 ||
        !containsLetters.hasMatch(description) ||
        onlyDigits.hasMatch(description) ||
        isGibberish(description)) {
      showError("Enter a valid service description.");
      return;
    }

    if (!mobileRegExp.hasMatch(mobile)) {
      showError("Enter a valid mobile number (e.g., 0300 1234567).");
      return;
    }

    try {
      await firebaseService.saveService(title, description, mobile);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Service Saved Successfully!')),
      );
      Navigator.pop(context);
    } catch (e) {
      showError("Failed to save service. Please try again.");
    }
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  bool isGibberish(String text) {
    if (text.isEmpty) return true;

    final repeatedChars = RegExp(r'(.)\1{4,}');
    final excessiveDigits = RegExp(r'\d{6,}');
    final longSingleWord = RegExp(r'\b\w{20,}\b');
    final symbolHeavy = RegExp(r'[^a-zA-Z0-9\s]{4,}');

    final words = text.trim().split(RegExp(r'\s+'));
    int validWordCount = words
        .where((word) =>
    word.length > 2 &&
        RegExp(r'[a-zA-Z]').hasMatch(word) &&
        !onlyDigits.hasMatch(word))
        .length;

    return validWordCount < 2 ||
        repeatedChars.hasMatch(text) ||
        excessiveDigits.hasMatch(text) ||
        longSingleWord.hasMatch(text) ||
        symbolHeavy.hasMatch(text);
  }

  Widget _buildShadowCard(String label, Widget field) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pinkAccent)),
            SizedBox(height: 10),
            field,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Provide Details', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pinkAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildShadowCard(
              'Service Title',
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'e.g., Home Tuitions, Tailoring',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pinkAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 2),
                  ),
                ),
              ),
            ),
            _buildShadowCard(
              'Service Description',
              TextField(
                controller: descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Describe the service you offer...',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pinkAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 2),
                  ),
                ),
              ),
            ),
            _buildShadowCard(
              'Mobile Number (only digits)',
              TextField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                maxLength: 15,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    String digits = newValue.text.replaceAll(' ', '');
                    if (digits.length <= 4) {
                      return TextEditingValue(
                        text: digits,
                        selection: TextSelection.collapsed(offset: digits.length),
                      );
                    } else {
                      String formatted =
                          digits.substring(0, 4) + ' ' + digits.substring(4);
                      return TextEditingValue(
                        text: formatted,
                        selection: TextSelection.collapsed(offset: formatted.length),
                      );
                    }
                  }),
                ],
                decoration: InputDecoration(
                  hintText: 'e.g., 0300 1234567',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pinkAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton.icon(
                onPressed: saveService,
                icon: Icon(Icons.check_circle_outline, color: Colors.pinkAccent),
                label: Text(
                  'Save',
                  style: TextStyle(fontSize: 16, color: Colors.pinkAccent),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.pinkAccent),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                  shadowColor: Colors.pinkAccent.withOpacity(0.2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
