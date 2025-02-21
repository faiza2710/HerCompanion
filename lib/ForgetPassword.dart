import 'package:flutter/material.dart';

class forgot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image with full width and responsive height
              Image.asset(
                'assets/images/logo.jpg',
                width: double.infinity, // Fill the available width
                height: MediaQuery.of(context).size.height * 0.5, // Adjust height for better responsiveness
                fit: BoxFit.fill, // Fill the space with the image, might distort aspect ratio
              ),
              // Text below the image
              Text(
                ' PASSWORD RESET',
                style: TextStyle(
                  fontSize: 30, // Adjust text size
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20), // Space between text and email field
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9, // Set width (90% of the screen width)
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.pink, // Icon color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2.0),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress, // Set appropriate keyboard type
                  ),
                ),
              ),

              SizedBox(height: 15,),
              // Login Button
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6, // Set width (60% of the screen width)
                  child: ElevatedButton(
                    onPressed: () {
                      // Login action
                      print("Login Button Pressed");
                    },
                    child: Text(
                      'SEND RESET EMAIL',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[400], // Button color
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    ),
                  ),
                ),
              ),

              Text(
                'Have a reset link?',
                style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


