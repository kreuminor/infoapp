import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Nyslogin extends StatelessWidget {
  final String title;

  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.lime,
  );

  Nyslogin(this.title);

  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _themeData.copyWith(
          primaryColor: Colors.orange,
        ),
        child:WebviewScaffold(
      appBar: new AppBar(
        title: new Text("NSCS Apply"),
      ),
      url: "https://nsc.heart-nta.org/Login.aspx",
     //withZoom: true,
    )
    );
  }
}
