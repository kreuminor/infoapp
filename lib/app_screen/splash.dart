import 'package:flutter/material.dart';
import 'package:heartinfo/app_screen/Home.dart';
import 'package:splashscreen/splashscreen.dart';

class  Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new Home(),
        title: new Text('HEART 2.0: BETTER WITH TIME', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,),),
        image: new Image.asset('images/hlogo1.png', ),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 200.0,
        loaderColor: Colors.red
    );
  }
}

