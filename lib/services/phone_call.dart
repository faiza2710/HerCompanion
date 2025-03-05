import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class phone_call extends StatefulWidget {
  const phone_call({super.key});

  @override
  State<phone_call> createState() => _phone_callState();
}

class _phone_callState extends State<phone_call> {
  Uri dialnumber = Uri.parse("tel:+923007278601");
  callnumber()async{
    await launchUrl(dialnumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('call in flutter'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: callnumber,
            child: Text('Call')),
      ),
    );

  }
}
