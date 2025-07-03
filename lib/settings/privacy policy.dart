import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_colors.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  void _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@hercompanionapp.com',
      query: Uri.encodeFull('subject=Privacy Policy Inquiry'),
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

  TextSpan _boldTitle(String title) => TextSpan(
    text: '\n$title\n',
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
  );

  TextSpan _body(String text) => TextSpan(
    text: '$text\n\n',
    style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text("Privacy Policy", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  children: [
                    _body(
                        "Her Companion is committed to protecting your privacy and ensuring a safe, secure experience while using our application."),
                    _boldTitle("Information Collection"),
                    _body(
                        "We collect minimal personal data such as your name, email, and contact number when you sign up or use features like service booking, community posts, or emergency contacts."),
                    _boldTitle("Usage of Information"),
                    _body(
                        "Your data is strictly used to enhance app functionality—such as matching services, joining discussions, managing daily planners, or sharing your location in case of emergencies. We do not sell, rent, or share your personal data with third parties."),
                    _boldTitle("Data Security"),
                    _body(
                        "All your information is securely stored in Firebase and protected with modern encryption standards. Only you and authorized system services can access it."),
                    _boldTitle("Community Guidelines"),
                    _body(
                        "Any content you post in the community must respect others' privacy, avoid offensive language, and follow our safe and inclusive usage policy."),
                    _boldTitle("Location Access"),
                    _body(
                        "We request location access only during emergencies or when using service features like home service booking, to ensure your safety and convenience."),
                    _boldTitle("Third-Party Services"),
                    _body(
                        "Her Companion may use third-party services such as Firebase, Google APIs, or job listing platforms. These providers follow their own strict privacy and security policies."),
                    _boldTitle("Your Rights"),
                    _body(
                        "You have full control over your data. You can view, edit, or delete your personal information from within the app or by contacting our support."),
                    _boldTitle("Changes to the Policy"),
                    _body(
                        "We may occasionally update our Privacy Policy. Users will be notified through the app about significant changes."),

                    // 🟣 Added Warning 1
                    _boldTitle("Disclaimer for External Communication"),
                    _body(
                        "Any communication or interaction that occurs outside of the Her Companion app, including phone calls, job applications, or third-party messaging, is beyond the scope of our responsibility."),

                    // 🟣 Added Warning 2
                    _boldTitle("No Liability for External Services"),
                    _body(
                        "Her Companion will not be held liable for any issues, misunderstandings, or harm that may result from interactions initiated through but conducted outside of the application."),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
