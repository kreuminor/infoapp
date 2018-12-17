import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:heartinfo/app_screen/main_pages/entry/overview.dart' as overview;
import 'package:heartinfo/app_screen/main_pages/entry/level1.dart' as level1;
import 'package:heartinfo/app_screen/main_pages/entry/level2.dart' as level2;
import 'package:heartinfo/app_screen/main_pages/entry/level3.dart' as level3;
import 'package:heartinfo/app_screen/main_pages/entry/level4.dart' as level4;
import 'package:heartinfo/app_screen/main_pages/entry/level5.dart' as level5;



class Entry extends StatelessWidget {
  final String title;


  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.black,
  );

  TabController controller;

  Entry(this.title);

  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _themeData.copyWith(
          primaryColor: Colors.purple[400],
        ),
        child: DefaultTabController(
            length: 6,
            child: Scaffold(
              appBar: new AppBar(
                bottom: TabBar(
                    controller: controller,
                    isScrollable: true,
                    labelColor: Colors.white,
                    indicatorColor: Colors.amber,
                    tabs: [
                      Tab(text: "OVERVIEW"),
                      Tab(text: "LEVEL 1",),
                      Tab(text: "LEVEL 2",),
                      Tab(text: "LEVEL 3",),
                      Tab(text: "LEVEL 4",),
                      Tab(text: "LEVEL 5",)
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
                  new overview.Overview(),
                  new level1.Level1(),
                  new level2.Level2(),
                  new level3.Level3(),
                  new level4.Level4(),
                  new level5.Level5()
                ],
              ),
              floatingActionButton: SpeedDial(
                animatedIcon: AnimatedIcons.menu_close,
                animatedIconTheme: IconThemeData(size: 25.0),
                curve: Curves.bounceIn,
                backgroundColor: Colors.purple[300],
                overlayColor: Colors.black,
                overlayOpacity: 0.1,
                onOpen: () => print('OPENING'),
                onClose: () => print('CLOSED'),
                tooltip: 'Apply Dialer',
                heroTag: 'speed-dial-hero-tag',
                foregroundColor: Colors.white,
                elevation: 9.0,
                shape: CircleBorder(),
                children: [
                  SpeedDialChild(
                      child: Icon(Icons.email),
                      backgroundColor: Colors.purpleAccent,
                      elevation: 5.0,
                      label: 'Email',
                      labelStyle: TextStyle(fontSize: 12.0),
                      onTap: () { }
                  ),
                  SpeedDialChild(
                      child: Icon(Icons.phone),
                      backgroundColor: Colors.purpleAccent,
                      elevation: 5.0,
                      label: 'Call',
                      labelStyle: TextStyle(fontSize: 12.0),
                      onTap: () { }
                  )
                 ],
              ),
            )
        )
    );
  }
}