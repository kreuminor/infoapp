import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Jfll extends StatelessWidget {
  final String title;

  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.lime,
  );

  Jfll(this.title);

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
              child: new Text("JFLL", style: TextStyle(fontSize: 25.0),),
            ),
          ),
        )
    );
  }
}