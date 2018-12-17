import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class Face extends StatelessWidget {
  final String title;

  Face(this.title);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: new AppBar(
        title: new Text(title),
        centerTitle: true,
      ),
      url: "https://www.facebook.com/HEARTTrustNTA/",
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.redAccent,
        child: const Center(
          child: Text('Waiting.....'),
        ),
      ),

    );
  }
}
