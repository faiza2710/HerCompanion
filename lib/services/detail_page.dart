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
    String phoneNumber = widget.serviceContact.replaceAll(' ', ''); // Remove spaces

    if (phoneNumber.startsWith('0')) {
      phoneNumber = '+92${phoneNumber.substring(1)}'; // Replace leading 0 with +92
    }

    final Uri dialNumber = Uri.parse("tel:$phoneNumber");

    if (await canLaunchUrl(dialNumber)) {
      await launchUrl(dialNumber);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch dialer. Make sure your device supports calling.')),
      );
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
            SizedBox(height: 20),
            Text(
              widget.serviceName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              widget.serviceDescription,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _makeCall,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
              child: Text(
                'Contact: ${widget.serviceContact}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
