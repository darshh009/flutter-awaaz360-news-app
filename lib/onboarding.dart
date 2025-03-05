import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/home.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentIndex = 0;
  final List<String> _images = [
    "assets/images/onboarding.png",
    "assets/images/onboarding2.png",
    "assets/images/onboarding3.png",
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds:3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _images.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🌟 Background Image with Auto-Change Effect
          AnimatedSwitcher(
            duration: Duration(seconds:1), // Smooth transition effect
            child: Container(
              key: ValueKey<String>(_images[_currentIndex]),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(170, 146, 141, 171), // Soft Grayish Purple
                    Color.fromARGB(200, 0, 210, 255), // Light Blue
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Image.asset(
                _images[_currentIndex],
                height: MediaQuery.of(context).size.height / 1.7,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// 🌟 White Bottom Section with Branding
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 1.8),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 5),
                /// 🌟 App Name
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "Awaaz",
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade900,
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Colors.black38,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "360",
                      style: GoogleFonts.teko(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.orange.shade900,
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Colors.grey,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),

                /// 🌟 Slogan
                Text(
                  "Stay Updated with Awaaz360\nNews That Matters",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade900,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),

                SizedBox(height: 12),

                /// 🌟 Logo/Icon
                Image.asset(
                  "assets/images/icon_name.png",
                  width: MediaQuery.of(context).size.width / 4.0,
                ),

                SizedBox(height: 15),

                /// 🌟 Get Started Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    shadowColor: Colors.blueAccent.shade700,
                    minimumSize: Size(MediaQuery.of(context).size.width / 1.2, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.blue.shade900,
                    foregroundColor: Colors.white
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));


                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.bold

                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
