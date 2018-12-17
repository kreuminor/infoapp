import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class Maps extends StatelessWidget {
  final String title;

  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.lime,
  );

  Maps(this.title);

  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _themeData.copyWith(
          primaryColor: Colors.green[500],
        ),
        child: Scaffold(
          appBar: new AppBar(
            title: new Text(title),
            centerTitle: true,
            actions: <Widget>[
            ],
            elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
          ),
          body: new Container(
              child: new Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 1.0, bottom: 0.0)),
                  new Image.asset("images/intramap.png"),
                  Divider(),
                  new Expanded(
                      child: new ListView(
                        children: <Widget>[
                          Divider(height: 10.0, color: Colors.black,),
                          ListTile(
                            leading: new Image.asset("images/globe.png",),
                            title: new Text("Institutions (HEART Operated)", style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: new Text("HEART Colleges and VTC's", style: TextStyle(fontStyle: FontStyle.italic),),
                            onTap: () {Navigator.of(context).pushNamed("/o");},
                          ),
                          Divider(height: 1.5, color: Colors.black),
                          ListTile(
                            leading: new Image.asset("images/globe.png"),
                            title: new Text("HEART Institutions (CTI's)", style: TextStyle(fontWeight: FontWeight.bold,),),
                            subtitle: new Text("Community Training Intervention", style: TextStyle(fontStyle: FontStyle.italic),),
                            onTap: () { },
                          ),
                          Divider(height: 1.5, color: Colors.black),
                          ListTile(
                            leading: new Image.asset("images/globe.png"),
                            title: new Text("HEART Institutions (JFLL)", style: TextStyle(fontWeight: FontWeight.bold,),),
                            subtitle: new Text("Adult Training Centres", style: TextStyle(fontStyle: FontStyle.italic),),
                            onTap: () { },
                          ),
                          Divider(height: 1.5, color: Colors.black),
                          ListTile(
                            leading: new Image.asset("images/globe.png"),
                            title: new Text("HEART Institutions (NYS)", style: TextStyle(fontWeight: FontWeight.bold,),),
                            subtitle: new Text("Youth Training Centres", style: TextStyle(fontStyle: FontStyle.italic),),
                            onTap: () { },
                          ),
                          Divider(height: 1.5, color: Colors.black)
                        ],
                      ))
                ],
              )),
        )
    );
  }
}