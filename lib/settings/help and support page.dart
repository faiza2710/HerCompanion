import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../app_colors.dart'; // Ensure this points to your correct color file

class HelpSupportPage extends StatefulWidget {
  const HelpSupportPage({super.key});

  @override
  State<HelpSupportPage> createState() => _HelpSupportPageState();
}

class _HelpSupportPageState extends State<HelpSupportPage> {
  final _formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final questionCtrl = TextEditingController();
  bool isSubmitting = false;

  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'support@hercompanionapp.com',
      query: 'subject=Need Help or Support&body=Hi, I need help regarding...',
    );

    try {
      if (!await launchUrl(emailUri, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch email app');
      }
    } catch (e) {
      _showCustomSnackBar('No email app found on this device.', isError: true);
    }
  }

  Future<void> _submitFAQ() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isSubmitting = true);

      try {
        await FirebaseFirestore.instance.collection('faq_queries').add({
          'name': nameCtrl.text.trim(),
          'email': emailCtrl.text.trim(),
          'question': questionCtrl.text.trim(),
          'timestamp': FieldValue.serverTimestamp(),
        });

        _showCustomSnackBar('Your query has been submitted!');

        nameCtrl.clear();
        emailCtrl.clear();
        questionCtrl.clear();
      } catch (e) {
        _showCustomSnackBar('Failed to submit. Please try again.', isError: true);
      } finally {
        setState(() => isSubmitting = false);
      }
    }
  }

  void _showCustomSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          heightFactor: 1,
          child: Text(
            message,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: isError ? Colors.redAccent : secondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        duration: Duration(seconds: 3),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: secondaryColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: secondaryColor, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      border: OutlineInputBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text("Help & Support", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildHelpCard(
              icon: Icons.email_outlined,
              title: "Email Support",
              description: "Tap below to contact us directly via email.",
              action: GestureDetector(
                onTap: _launchEmail,
                child: Text(
                  "support@hercompanionapp.com",
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),

            // FAQ with integrated form
            Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 20),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(12)),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.help_outline, size: 30, color: Colors.pinkAccent),
                        SizedBox(width: 10),
                        Text(
                          "FAQs",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Submit your question. We’ll get back to you soon.",
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                    SizedBox(height: 12),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameCtrl,
                            decoration: _inputDecoration('Your Name'),
                            validator: (val) =>
                            val == null || val.isEmpty ? 'Enter name' : null,
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                            decoration: _inputDecoration('Email Address'),
                            validator: (val) => val == null || !val.contains('@')
                                ? 'Enter valid email'
                                : null,
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: questionCtrl,
                            maxLines: 3,
                            decoration: _inputDecoration('Your Question'),
                            validator: (val) => val == null || val.isEmpty
                                ? 'Enter your question'
                                : null,
                          ),
                          SizedBox(height: 16),
                          Center(
                            child: ElevatedButton.icon(
                              onPressed: isSubmitting ? null : _submitFAQ,
                              icon: Icon(Icons.send),
                              label: Text("Submit"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.pinkAccent,
                                side: BorderSide(color: Colors.pinkAccent),
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            _buildHelpCard(
              icon: Icons.phone_in_talk,
              title: "Live Chat (Coming Soon)",
              description: "Chat support will be available soon in the app.",
              action: Text(
                "Stay tuned!",
                style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpCard({
    required IconData icon,
    required String title,
    required String description,
    required Widget action,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 30, color: Colors.pinkAccent),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(height: 8),
                  Text(description,
                      style: TextStyle(fontSize: 15, color: Colors.black87)),
                  SizedBox(height: 10),
                  action,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
