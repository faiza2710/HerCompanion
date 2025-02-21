//line no.131 to change
import 'package:flutter/material.dart';
import 'package:fyp/GenderChecker.dart';
import 'package:fyp/bottom_navigation_screen.dart';
import 'package:fyp/components/onboarding_items.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:fyp/screens/home.dart';
import 'package:fyp/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color:Colors.white,
        padding: const EdgeInsets.fromLTRB(10,0,10,20),
        child: isLastPage? getStarted() : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            //Skip Button
            TextButton(
                onPressed: ()=>pageController.jumpToPage(controller.items.length-1),
                child: const Text("Skip"
                ,style: TextStyle(
                    fontSize: 15,
                    color: Colors.pink
                  ),)),

            //Indicator
            SmoothPageIndicator(
              controller: pageController,
              count: controller.items.length,
              onDotClicked: (index)=> pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 400), curve: Curves.easeIn),
              effect: const WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: Colors.pink,
              ),
            ),

            //Next Button
            TextButton(
                onPressed: ()=>pageController.nextPage(
                    duration: const Duration(milliseconds: 400), curve: Curves.easeIn),
                child: const Text("Next",style: TextStyle(
                    fontSize: 15,
                    color: Colors.pink
                ))),


          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 0),
        child: PageView.builder(
            onPageChanged: (index)=> setState(()=> isLastPage = controller.items.length-1 == index),
            itemCount: controller.items.length,
            controller: pageController,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(20.0), // Adjust the padding value as needed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(controller.items[index].image),
                    const SizedBox(height: 15),
                    Text(
                      controller.items[index].title,
                      style: const TextStyle(
                        color: Colors.pink,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Wrap the Text widget in a Container to control width
                    Container(
                      width: double.infinity, // Make the container take full width
                      child: Text(
                        controller.items[index].descriptions,
                        style: const TextStyle(
                          color: Colors.pink,
                          fontSize: 11,
                        ),
                        textAlign: TextAlign.center, // Justify the text
                      ),
                    ),
                  ],
                ),
              );

            }),
      ),
    );
  }

  //Now the problem is when press get started button
  // after re run the app we see again the onboarding screen
  // so lets do one time onboarding

  //Get started button

  Widget getStarted(){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.pinkAccent
      ),
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      child: TextButton(
          onPressed: ()async{
            final pres = await SharedPreferences.getInstance();
            pres.setBool("onboarding", true);

            //After we press get started button this onboarding value become true
            // same key
            if(!mounted)return;
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>VoiceRecorderApp()));
          },
          child: const Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
    );
  }
}




