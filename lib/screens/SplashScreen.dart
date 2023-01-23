import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import './Login.dart';
import './Login2.dart';
import './Settings.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashScreen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mHeight = size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final mWidth = size.width;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 241, 247, 255),
            Color.fromARGB(255, 218, 238, 255),
            Color.fromARGB(255, 212, 235, 255),
            Color.fromARGB(255, 203, 231, 255),
            Color.fromARGB(255, 198, 228, 255),
            Color.fromARGB(255, 182, 221, 255),
            // Theme.of(context).backgroundColor,
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 0.2, 0.4, 0.6, 0.8, 0.9, 1.0],
          // stops: [0.0],
          //titleMode --> clamp means that the gradient will not be repeated
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: const Duration(seconds: 2),
        child: Center(
          child: AnimatedSplashScreen(
            splash: Center(
              child: Container(
                child: Image.asset(
                  //change image size here
                  'assets/images/Mersal1.png',
                ),
              ),
            ),
            splashTransition: SplashTransition.scaleTransition,
            duration: 1000,
            animationDuration: const Duration(seconds: 2),
            backgroundColor: Colors.transparent,
            splashIconSize: mWidth * 0.6,
            // nextScreen: Login(),
            nextScreen: Settings(),
          ),
        ),
      ),
    );
  }
}
