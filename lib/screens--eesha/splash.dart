//line no.25 to change
import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:fyp/bottom_navigation_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fyp/screens/onboarding.dart';
import 'package:fyp/screens/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start the onboarding check after the splash screen duration
    Future.delayed(Duration(seconds: 5), () async {
      final prefs = await SharedPreferences.getInstance();
      final onboarding = prefs.getBool("onboarding") ?? false;

      // Navigate to the appropriate screen based on onboarding status
      if (onboarding) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  BottomNavigationScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingView()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: splash(),
      ),
    );
  }
}

class splash extends StatelessWidget {
  const splash({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.white,
      duration: Duration(seconds: 5), // set the duration to 5 seconds
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: SizedBox(
        height: 1000,
        width: 1000,
        child: Image.asset("assets/images/logo.jpg"),
      ),
      onAnimationEnd: () => debugPrint("On Fade In End"),
    );
  }
}