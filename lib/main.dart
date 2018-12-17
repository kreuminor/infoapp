import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heartinfo/app_screen/Home.dart';
import 'package:heartinfo/app_screen/AnimatedSplashScreen.dart';
import 'package:heartinfo/app_screen/carousel/appcase.dart';
import 'package:heartinfo/app_screen/data/job/jobs.dart';
import 'package:heartinfo/app_screen/data/offerings/local/adult.dart';
import 'package:heartinfo/app_screen/data/offerings/local/dfghj.dart';
import 'package:heartinfo/app_screen/data/offerings/local/heart.dart';
import 'package:heartinfo/app_screen/data/offerings/adult.dart';
import 'package:heartinfo/app_screen/data/offerings/heart.dart';
import 'package:heartinfo/app_screen/data/offerings/local/vtdi.dart';
import 'package:heartinfo/app_screen/data/offerings/local/youth.dart';
import 'package:heartinfo/app_screen/data/offerings/vtdi.dart';
import 'package:heartinfo/app_screen/data/offerings/youth.dart';
import 'package:heartinfo/app_screen/download/jsonheart.dart';
import 'package:heartinfo/app_screen/main_pages/apply.dart';
import 'package:heartinfo/app_screen/main_pages/apply/login/dummy/default_login_jfll.dart';
import 'package:heartinfo/app_screen/main_pages/apply/login/dummy/default_login_jps.dart';
import 'package:heartinfo/app_screen/main_pages/apply/login/dummy/default_login_ndar.dart';
import 'package:heartinfo/app_screen/main_pages/apply/login/dummy/default_login_nys.dart';
import 'package:heartinfo/app_screen/main_pages/apply/login/dummy/default_login_vtdi.dart';
import 'package:heartinfo/app_screen/main_pages/apply/login/jflllogin.dart';
import 'package:heartinfo/app_screen/main_pages/apply/login/ndarlogin.dart';
import 'package:heartinfo/app_screen/main_pages/apply/login/nyslogin.dart';
import 'package:heartinfo/app_screen/main_pages/apply/login/vtdilogin.dart';
import 'package:heartinfo/app_screen/main_pages/customer.dart';
import 'package:heartinfo/app_screen/main_pages/entry.dart';
import 'package:heartinfo/app_screen/main_pages/faq.dart';
import 'package:heartinfo/app_screen/main_pages/job.dart';
import 'package:heartinfo/app_screen/main_pages/job/job_placement.dart';
import 'package:heartinfo/app_screen/main_pages/job/login.dart';
import 'package:heartinfo/app_screen/main_pages/maps.dart';
import 'package:heartinfo/app_screen/main_pages/maps/heart.dart';
import 'package:heartinfo/app_screen/main_pages/programme.dart';
import 'package:heartinfo/app_screen/settings/settings.dart';
import 'package:heartinfo/app_screen/social/facebook.dart';
import 'package:heartinfo/app_screen/social/instagram.dart';
import 'package:heartinfo/app_screen/social/twitter.dart';
import 'package:heartinfo/app_screen/splash.dart';



void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MyApp());
}

final ThemeData _themeData = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  accentColor: Colors.blue,
);


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: _themeData,
      home: new Splash(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context)=> new Programme("Training Programmes"),
        "/b": (BuildContext context)=> new Apply("How to Apply"),
        "/c": (BuildContext context)=> new Entry("Entry Requirements"),
        "/d": (BuildContext context)=> new Customer("Customer Care"),
        "/e": (BuildContext context)=> new Job("Job Placement Portal"),
        "/f": (BuildContext context)=> new Maps("HEART Maps"),
        "/g": (BuildContext context)=> new Faq("Frequently Asked Questions"),
        "/h": (BuildContext context)=> new Settings(),
        //-----Social
        "/i": (BuildContext context)=> new Twitter("Twitter Feed"),
        "/j": (BuildContext context)=> new Face("Facebook Feed"),
        "/k": (BuildContext context)=> new Gram("Instagram Feed"),
        //------Downloading
        "/l": (BuildContext context)=> new JsonPage(),
        //------Placement
        "/m": (BuildContext context)=> new JobPage(),
        "/n": (BuildContext context)=> new JobApp("Job Placement Login"),
        //------Maps
        "/o": (BuildContext context)=> new Heartmap("Institutions (HEART Operated)"),
        //"/p": (BuildContext context)=> new MapState("Institutions (HEART Operated)"),
        //"/q": (BuildContext context)=> new MapState("Institutions (HEART Operated)"),
        //"/r": (BuildContext context)=> new MapState("Institutions (HEART Operated)"),
        //------Applying
        "/s": (BuildContext context)=> new Nyslogin("NSCS Login"),
        "/t": (BuildContext context)=> new Vtdilogin("iSIMS Login"),
        "/u": (BuildContext context)=> new Ndar("HEART Login"),
        "/v": (BuildContext context)=> new Jfll("JFLL Login"),
        //------Dummy Login
        "/w": (BuildContext context)=> new NDARPage(),
        "/x": (BuildContext context)=> new NYSPage(),
        "/y": (BuildContext context)=> new JFLLPage(),
        "/z": (BuildContext context)=> new VTDIPage(),
        "/1": (BuildContext context)=> new JPSPage(),
        //------Programme
        "/pa": (BuildContext context)=> new HeartPage(),
        "/pb": (BuildContext context)=> new VtdiPage(),
        "/pc": (BuildContext context)=> new YouthPage(),
        "/pd": (BuildContext context)=> new AdultPage(),
        "/0": (BuildContext context)=> new Home(),
        //------Local json
        "/a1": (BuildContext context)=> new FetchPage(),
        "/a2": (BuildContext context)=> new VtdiLPage(),
        "/a3": (BuildContext context)=> new AdultLPage(),
        "/a4": (BuildContext context)=> new YouthLPage(),
        "/a5": (BuildContext context)=> new JobLPage(),
        //------Carousel
        "/a6": (BuildContext context)=> new CarouselPage(),
      },
    );
  }
}



