import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:heartinfo/app_screen/carousel/display.dart' as cara;

class Settings extends StatefulWidget {
  const Settings();
  @override
  _SettingsState createState() => new _SettingsState();
}

class _SettingsState extends State<Settings> {

  static const String flutterUrl = 'https://flutter.io/';
  static const String githubUrl = 'http://www.codesnippettalk.com';

  static const TextStyle linkStyle = const TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );


  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.lime,
  );

  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _themeData.copyWith(
          primaryColor: Colors.white,
        ),
        child: Scaffold(
        appBar: new AppBar(
        titleSpacing: 0.0,
        //elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: new Text("Settings", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: <Widget>[
      new IconButton(icon: Icon(Icons.info, color: Colors.black54,),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildAboutDialog(context),
              );
            } )
        ],
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Expanded(
                child: new ListView(
                  children: <Widget>[
                    ListTile(
                      leading: new Icon(Icons.tv, size: 35.0, color: Colors.black54,),
                      title: new Text("App Showcase", style: TextStyle(fontWeight: FontWeight.bold,),),
                      subtitle: new Text("Confused on how you use the app?...", style: TextStyle(fontStyle: FontStyle.italic),),
                      onTap: () {Navigator.of(context).pushNamed("/a6"); },
                    ),
                    Divider(height: 1.5, color: Colors.black),
                    ListTile(
                      leading: new Icon(Icons.restore_page, size: 35.0, color: Colors.black54,),
                      title: new Text("Refresh App Data", style: TextStyle(fontWeight: FontWeight.bold,),),
                      subtitle: new Text("Refresh ALL Data Sources...", style: TextStyle(fontStyle: FontStyle.italic),),
                      onTap: () { Navigator.of(context).pushNamed("/l");},
                    ),
                    Divider(height: 1.5, color: Colors.black),
                    ListTile(
                      leading: new Icon(Icons.panorama, size: 35.0, color: Colors.black54,),
                      title: new Text("HEART Promotions", style: TextStyle(fontWeight: FontWeight.bold,),),
                      subtitle: new Text("Guess what is happening now?...", style: TextStyle(fontStyle: FontStyle.italic),),
                      onTap: () { },
                    ),
                    Divider(height: 1.5, color: Colors.black),
                    ListTile(
                      leading: new Icon(Icons.assessment, size: 35.0, color: Colors.black54,),
                      title: new Text("HEART Survey", style: TextStyle(fontWeight: FontWeight.bold,),),
                      subtitle: new Text("Help us to complete this survey...", style: TextStyle(fontStyle: FontStyle.italic),),
                      onTap: () { },
                    ),
                    Divider(height: 1.5, color: Colors.black)
                  ],
                ))
          ],
        ),
      ),
    )
    );
  }
}

Widget _buildAboutDialog(BuildContext context) {
  return new AlertDialog(
    //title: const Text('HEARTInfo App'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildAboutText(),
        _buildLogoAttribution(),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}

Widget _buildAboutText() {
  return new Column(
    children: <Widget>[
      new Image.asset("images/hlogo1.png", width: 220.0),
      new RichText(
        text: new TextSpan(
        text: '',
        style: const TextStyle(color: Colors.black87),
      children: <TextSpan>[
      const TextSpan(text: 'The app was developed in house '),
      new TextSpan(
        //text: 'talented IT Department',
        //recognizer: _flutterTapRecognizer,
        //style: linkStyle,
      ),
      const TextSpan(
          text: 'by our talented IT Department. A collaboration '
              'between the BI (Business Intelligence), SD (Software Development), '
              'and  Operations Units '
        //'code yourself from ',
      ),
      new TextSpan(
        text: '',
        //recognizer: _githubTapRecognizer,
        //style: linkStyle,
      ),
      const TextSpan(text: '.'),
    ],
  ),
  )
    ],
  );


}

Widget _buildLogoAttribution() {
  return new Padding(
    padding: const EdgeInsets.only(top: 0.0),
    child: new Row(
      children: <Widget>[
        //Divider(height: 55.0,),
        new Padding(
          padding: const EdgeInsets.only(top: 0.0),
         // child: new Text("2017 HEART Trust/NTA", style: TextStyle(color: Colors.red, fontSize: 10.0),),
        ),
      ],
    ),
  );
}
