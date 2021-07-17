import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

class SpringExample extends StatelessWidget {
  final SpringController springController =
  SpringController(initialAnim: Motion.play);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          onTap: () {
            //for controlling the animation..
            springController.play(
              motion: Motion.reverse, //optional
              animDuration: Duration(seconds: 1), //optional
              curve: Curves.bounceInOut, //optional
              delay: Duration(milliseconds: 300), //optional
            );
          },
          child: Spring.slide(
            springController: springController,  //optional
            slideType: SlideType.slide_in_left, //required
            withFade: true, // default false
            animDuration: Duration(seconds: 2), //default 1 second
            //optional
            animStatus: (AnimStatus status) {
              print(status.toString());
            },
            curve: Curves.easeIn, //default Curves.eadInOut
            delay: Duration(milliseconds: 300), //default 0 second
            extend: 30, //default 10
            child: FlutterLogo(size: 100),
          ),
        ),
      ),
    );
  }
}
