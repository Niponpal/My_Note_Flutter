

import 'package:flutter/material.dart';
import 'package:mynoteds/screen/home/ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  autoNavigate() async {
   await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen() ));
  }

  @override
 @override
  void initState() {
    // call this autoNavigete Funtionss
    autoNavigate();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.black,     // 🔥 Black background
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset(
                  "assets/NotedLogo.png",
                  width: 320,
                  height: 320,
                ),

                SizedBox(height: 20),

                Text(
                  "Create Your Noted",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,   // 🔥 Text color white so it is visible on black background
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}


