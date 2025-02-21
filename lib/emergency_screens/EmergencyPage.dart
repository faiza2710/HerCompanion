import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:telephony/telephony.dart';

class EmergencyPage extends StatefulWidget {
  @override
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  final Telephony telephony = Telephony.instance;
  final String emergencyNumber = "03013666203"; // Replace with actual contact number

  Future<void> _sendEmergencySMS() async {
    Position position = await _getCurrentLocation();
    String message = "🚨 Emergency! I need help. My location: "
        "https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}";

    bool? permissionsGranted = await telephony.requestSmsPermissions;

    if (permissionsGranted == true) {
      try {
        await telephony.sendSms(
          to: emergencyNumber,
          message: message,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Emergency message sent!")),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to send SMS: $e")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("SMS permission denied. Enable it in settings.")),
      );
    }
  }



  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Location services are disabled.")),
      );
      return Future.error("Location services are disabled.");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Location permission denied.")),
        );
        return Future.error("Location permission denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Location permission permanently denied. Enable it in settings.")),
      );
      return Future.error("Location permission permanently denied.");
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emergency"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Press to contact emergency", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _sendEmergencySMS,
              icon: Icon(Icons.sms, color: Colors.white),
              label: Text("Send SOS"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
