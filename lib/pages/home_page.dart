import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _isLogged = false;

  final SpringController springController =
  SpringController(initialAnim: Motion.play);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/im_party.jpeg'),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.6),
                Colors.black.withOpacity(.4),
                Colors.black.withOpacity(.2),
              ]
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100,),
              _SlideAnimation(300, -200.0, 0.0,
                Text('Find the best parties near you.', style: TextStyle(color: Colors.yellow, fontSize: 40)),
              ),
              SizedBox(height: 10,),
              _SlideAnimation(300, -100.0, 0.0,
                Text('Let us find you a party for your interest', style: TextStyle(color: Colors.greenAccent, fontSize: 25)),
              ),

              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _isLogged ?
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.yellow[900]
                        ),
                        child: Center(
                          child: Text('Start', style: TextStyle(color: Colors.white, fontSize: 20),),
                        ),
                      ):
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.red
                              ),
                              child: Center(
                                child: Text('Google+', style: TextStyle(color: Colors.white, fontSize: 20),),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue
                              ),
                              child: Center(
                                child: Text('Facebook', style: TextStyle(color: Colors.white, fontSize: 20),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
              ),

            ],
          ),
        )
      )
    );
  }

  Widget _SlideAnimation(delay, y1, y2, child){
    return Spring.slide(
        springController: springController,
        slideType: SlideType.slide_in_top,
        withFade: true,
        cutomTweenOffset: Tween(begin: Offset(0,y1), end: Offset(0,y2)),
        delay: Duration(milliseconds: delay),
        child: child
    );
  }

}
