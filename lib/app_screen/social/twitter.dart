import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Twitter extends StatelessWidget {
  final String title;

  Twitter(this.title);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: new AppBar(
        title: new Text(title),
        centerTitle: true,
      ),
        url: "https://twitter.com/hearttrustnta?lang=en",
        withZoom: true,
    );
  }
}
