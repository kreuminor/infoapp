import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class JobApp extends StatelessWidget {
  final String title;

  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.lime,
  );

  JobApp(this.title);

  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _themeData.copyWith(
          primaryColor: Colors.amber[700],
        ),
        child:WebviewScaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      url: "https://jobs.heart-nta.org/login.aspx?ReturnUrl=%2f",
     //withZoom: true,
    )
    );
  }
}
