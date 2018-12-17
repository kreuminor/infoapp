import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Gram extends StatelessWidget {
  final String title;

  Gram(this.title);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: new AppBar(
        title: new Text(title),
        centerTitle: true,
      ),
      url: "https://www.instagram.com/hearttrustnta/?hl=en",
      withZoom: true,
    );
  }
}
