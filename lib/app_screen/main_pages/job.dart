import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Job extends StatelessWidget {
  final String title;

  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.amber,
  );

  Job(this.title);

  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _themeData.copyWith(
          primaryColor: Colors.amber[700],
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
                  new Image.asset("images/caps.png"),
                  new Expanded(
                      child: new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),),
                        child: new Column(
                           children: <Widget>[
                          ListTile(
                            leading: new Image.asset("images/searh.png"),
                            title: new Text("JOB VACANCIES", style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: new Text("See our array of Jobs...", style: TextStyle(fontStyle: FontStyle.italic),),
                            onTap: () { Navigator.of(context).pushNamed("/a5");},
                          ),
                          Divider(height: 1.5, color: Colors.black),
                          ListTile(
                            leading: new Image.asset("images/jobsearch.png"),
                            title: new Text("JOB PLACEMENT LOGIN", style: TextStyle(fontWeight: FontWeight.bold,),),
                            subtitle: new Text("Already have a login?...", style: TextStyle(fontStyle: FontStyle.italic),),
                            onTap: () { Navigator.of(context).pushNamed("/1");},
                          ),
                          Divider(height: 1.5, color: Colors.black),

                        ],
                      )
                      )
                  )],
              )),
        )
    );
  }
}