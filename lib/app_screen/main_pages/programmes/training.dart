import 'package:flutter/material.dart';

class Heart extends StatelessWidget {
  final String title;

  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.black,
  );
  Heart(this.title);

  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _themeData.copyWith(
        primaryColor: Colors.orange),
        child: Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Container(
        child: new Center(
          child: new Text("HEART PROGRAMMES", style: TextStyle(fontSize: 25.0),),
        ),
      ),
    )
    );
  }
}