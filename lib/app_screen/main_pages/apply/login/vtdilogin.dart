import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Vtdilogin extends StatelessWidget {
  final String title;

  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.lime,
  );

  Vtdilogin(this.title);

  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _themeData.copyWith(
          primaryColor: Colors.orange,
        ),
        child:WebviewScaffold(
      appBar: new AppBar(
        title: new Text("iSIMS Apply"),
      ),
      url: "https://isims.heart-nta.org/apply.aspx",
     //withZoom: true,
    )
    );
  }
}
