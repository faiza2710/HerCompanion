import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceProfilePage extends StatefulWidget {
  final String serviceName;
  final String serviceDescription;
  final String serviceContact;

  const ServiceProfilePage({
    required this.serviceName,
    required this.serviceDescription,
    required this.serviceContact,
    super.key,
  });

  @override
  State<ServiceProfilePage> createState() => _ServiceProfilePageState();
}

class _ServiceProfilePageState extends State<ServiceProfilePage> {
  Future<void> _makeCall() async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.pinkAccent, // Secondary color
        title: Text(
          "Proceed to Call",
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          "You are about to make a phone call.\n\n"
              "All communication will happen outside the app. "
              "We are not responsible for any issues or problems related to this service.\n\n"
              "Do you want to continue?",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text("Cancel", style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.pinkAccent,
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text("Continue"),
          ),
        ],
      ),
    );

    if (confirm == true) {
      String phoneNumber = widget.serviceContact.replaceAll(' ', '');
      if (phoneNumber.startsWith('0')) {
        phoneNumber = '+92${phoneNumber.substring(1)}';
      }

      final Uri dialNumber = Uri.parse("tel:$phoneNumber");

      if (await canLaunchUrl(dialNumber)) {
        await launchUrl(dialNumber);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not launch dialer. Make sure your device supports calling.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '${widget.serviceName} Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pinkAccent,
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
            _buildCard("Service Name", widget.serviceName),
            _buildCard("Description", widget.serviceDescription),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: _makeCall,
                icon: Icon(Icons.call, color: Colors.pinkAccent),
                label: Text(
                  'Call: ${widget.serviceContact}',
                  style: TextStyle(color: Colors.pinkAccent),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.pinkAccent),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 4,
                  shadowColor: Colors.pinkAccent.withOpacity(0.2),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String content) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
            TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pinkAccent),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(fontSize: 16, color: Colors.black87),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
