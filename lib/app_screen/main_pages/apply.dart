import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:heartinfo/app_screen/main_pages/apply/training.dart' as training;
import 'package:heartinfo/app_screen/main_pages/apply/adult.dart' as adult;
import 'package:heartinfo/app_screen/main_pages/apply/youth.dart' as youth;
import 'package:heartinfo/app_screen/main_pages/apply/vtdi.dart' as vtdi;


class Apply extends StatelessWidget {
  final String title;

  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.lime,
  );

  TabController controller;

  Apply(this.title);

  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _themeData.copyWith(
          primaryColor: Colors.red[400],
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
                      Tab(text: "YOUTH EDUCATION",),
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
                  new training.Heart(),
                  new vtdi.Vtdi(),
                  new youth.Youth(),
                  new adult.Adult(),
                ],
              ),
              floatingActionButton: SpeedDial(
                animatedIcon: AnimatedIcons.menu_close,
                animatedIconTheme: IconThemeData(size: 25.0),
                curve: Curves.bounceIn,
                backgroundColor: Colors.red[300],
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
                      child: Icon(Icons.email, color: Colors.white,),
                      backgroundColor: Colors.red,
                      elevation: 5.0,
                      //label: 'Email',
                      labelStyle: TextStyle(fontSize: 12.0),
                      onTap: () {}
                  ),
                  SpeedDialChild(
                      child: Image.asset("images/whatsapp.png"),
                      backgroundColor: Colors.green,
                      elevation: 5.0,
                      //label: 'Whatsapp',
                      labelStyle: TextStyle(fontSize: 12.0),
                      onTap: () { }
                  ),
                ],
              ),
            )));
  }
}
