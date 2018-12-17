import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Programme extends StatelessWidget {
  final String title;

  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.blueGrey,
  );

  Programme(this.title);

  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _themeData.copyWith(
          primaryColor: Colors.cyan,
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
                  new Image.asset("images/training.png"),
                  new Expanded(
                      child: new Column(
                            children: <Widget>[
                              Divider(height: 3.0, color: Colors.black),
                              ListTile(
                                leading: new Image.asset("images/study.png"),
                                title: new Text("HEART Programmes", style: TextStyle(fontWeight: FontWeight.bold),),
                                subtitle: new Text("See our array of Jobs...", style: TextStyle(fontStyle: FontStyle.italic),),
                                onTap: () { Navigator.of(context).pushNamed("/a1");},
                              ),
                              Divider(height: 3.0, color: Colors.black),
                              ListTile(
                                leading: new Image.asset("images/study.png"),
                                title: new Text("VTDI Programmes", style: TextStyle(fontWeight: FontWeight.bold,),),
                                subtitle: new Text("Already have a login?...", style: TextStyle(fontStyle: FontStyle.italic),),
                                onTap: () { Navigator.of(context).pushNamed("/a2");},
                              ),
                              Divider(height: 3.0, color: Colors.black),
                              ListTile(
                                leading: new Image.asset("images/study.png"),
                                title: new Text("YOUTH Programmes", style: TextStyle(fontWeight: FontWeight.bold,),),
                                subtitle: new Text("Already have a login?...", style: TextStyle(fontStyle: FontStyle.italic),),
                                onTap: () { Navigator.of(context).pushNamed("/a4");},
                              ),
                              Divider(height: 3.0, color: Colors.black),
                              ListTile(
                                leading: new Image.asset("images/study.png"),
                                title: new Text("ADULT (JFLL) Programmes", style: TextStyle(fontWeight: FontWeight.bold,),),
                                subtitle: new Text("Already have a login?...", style: TextStyle(fontStyle: FontStyle.italic),),
                                onTap: () { Navigator.of(context).pushNamed("/a3");},
                              ),
                              //Divider(height: 3.0, color: Colors.black)

                            ],
                          )
                  )],

              )),
        )
    );
  }
}
