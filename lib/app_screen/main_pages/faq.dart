import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  final String title;

  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.lime,
  );

  TabController controller;

  Faq(this.title);

  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _themeData.copyWith(
          primaryColor: Colors.purple,
        ),
        child: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: new AppBar(
                bottom: TabBar(
                    controller: controller,
                    isScrollable: true,
                    labelColor: Colors.white,
                    indicatorColor: Colors.amber,
                    tabs: [
                      Tab(text: "TRAINING"),
                      Tab(text: "V.T.D.I.",),
                      Tab(text: "YOUTH DEVELOPMENT",),
                      Tab(text: "ADULT EDUCATION",)
                    ]),
                title: new Text(title),
                centerTitle: true,
                actions: <Widget>[
                ],
                elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
              ),
              body: new TabBarView(
                controller: controller,
                children: <Widget>[
                  //new overview.Overview(),
                  //new level1.Level1(),
                  //new level2.Level2(),
                  //new level3.Level3()
                ],
              ),

            )
        )
    );
  }
}