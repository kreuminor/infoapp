import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<ImageSplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushNamed("/0");
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Padding(padding: EdgeInsets.only(bottom: 35.0),child:new Image.asset('images/powered_by1.png',height: 45.0,fit: BoxFit.scaleDown,))


            ],),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'images/hlogo1.png',
                width: animation.value * 450,
                height: animation.value * 450,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
