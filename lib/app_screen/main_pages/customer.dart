import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:heartinfo/app_screen/data/call/calle.dart' as engage;
import 'package:heartinfo/app_screen/data/call/calla.dart' as adult;
import 'package:heartinfo/app_screen/data/call/callh.dart' as heart;
import 'package:heartinfo/app_screen/data/call/cally.dart' as youth;
import 'package:heartinfo/app_screen/data/call/callad.dart' as admin;
import 'package:heartinfo/app_screen/main_pages/customer/admin.dart' as admin;
import 'package:heartinfo/app_screen/main_pages/customer/institutions.dart' as instituion;


class Customer extends StatelessWidget {
  final String title;


  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.black,
  );

  TabController controller;

  Customer(this.title);

  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _themeData.copyWith(
          primaryColor: Colors.blue,
        ),
        child: DefaultTabController(
            length: 5,
            child: Scaffold(
              appBar: new AppBar(
                bottom: TabBar(
                    controller: controller,
                    isScrollable: true,
                    labelColor: Colors.white,
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Tab(text: "ENGAGEMENT CENTRE"),
                      Tab(text: "INSTITUTIONS",),
                      Tab(text: "YOUTH CENTRES",),
                      Tab(text: "ADULT CENTRES",),
                      Tab(text: "ADMIN OFFICES",)
                    ]),
                title: new Text(title),
                centerTitle: true,
                actions: <Widget>[
                ],
                elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
              ),
              body: new Container(
                    child: TabBarView(
                controller: controller,
                children: <Widget>[
                  new engage.CallEPage(),
                  new heart.CallhPage(),
                  new youth.CallyPage(),
                  new adult.CallAPage(),
                  new admin.CallAdPage()
                ],
              ),
            ),
        ))
    );
  }
}

