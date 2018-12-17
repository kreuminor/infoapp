import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:shimmer/shimmer.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("HEARTInfo"),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.settings, color: Colors.white,),
              padding: EdgeInsets.only(right: 5.0),
              onPressed: () {
              Navigator.of(context).pushNamed("/h");
              } )
        ],
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
             new UserAccountsDrawerHeader(
                 accountName: new Text("HEART Trust/NTA"),
                 accountEmail: new Text("info@heart-nta.org"),
                 currentAccountPicture: new CircleAvatar(
                   backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                       ? Colors.cyan
                       : Colors.white,
                   child: new Image.asset("images/heart1.png"),
                 ),
               decoration: new BoxDecoration(
                 image: new DecorationImage(image: AssetImage("images/banner3.png"),
                   fit: BoxFit.cover
                 )
               ),
             ),
             new ListTile(
              leading: new Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: new Text("HOME"),
              onTap: () {},
            ),
            new ListTile(
              leading: new Icon(
                Icons.book,
                color: Colors.blueGrey,
              ),
              title: new Text("PROGRAMMES"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/a");
              },
            ),
            new ListTile(
              leading: new Icon(
                Icons.content_paste,
                color: Colors.blueGrey,
              ),
              title: new Text("HOW TO APPLY"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/b");
              },
            ),
            new ListTile(
              leading: new Icon(
                Icons.exit_to_app,
                color: Colors.blueGrey,
              ),
              title: new Text("ENTRY REQUIREMENTS"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/c");
              },
            ),
            Divider(height: 9.0, color: Colors.black),
            new ListTile(
              leading: new Icon(
                Icons.phone_in_talk,
                color: Colors.blueGrey,
              ),
              title: new Text("CUSTOMER CARE"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/d");
              },
            ),
            new ListTile(
              leading: new Icon(
                Icons.accessibility,
                color: Colors.blueGrey,
              ),
              title: new Text("JOB PLACEMENT"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/e");
              },
            ),
            new ListTile(
              leading: new Icon(
                Icons.map,
                color: Colors.blueGrey,
              ),
              title: new Text("HEART MAPS"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/f");
              },
            ),
            new ListTile(
              leading: new Icon(
                Icons.add_comment,
                color: Colors.blueGrey,
              ),
              title: new Text("F.A.Q.S."),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/g");
              },
            ),
            Divider(height: 9.0, color: Colors.black),
            new ListTile(
              leading: new Icon(
                Icons.settings,
                color: Colors.blueGrey,
              ),
              title: new Text("SETTINGS"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/h");
              },
            )
          ],
        ),
      ),
      body: new Container(
          child: new Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 1.0, bottom: 0.0)),
          new Image.asset("images/header.jpg"),
          new Expanded(
              child: new ListView(
                children: <Widget>[
                  ListTile(
                    leading: new Image.asset("images/study.png"),
                    title: new Text("TRAINING PROGRAMMES", style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: new Text("See our array of programmes...", style: TextStyle(fontStyle: FontStyle.italic),),
                    onTap: () { Navigator.of(context).pushNamed("/a");},
                  ),
                  Divider(height: 1.0, color: Colors.black),
                  ListTile(
                    leading: new Image.asset("images/applied.png"),
                    title: new Text("HOW TO APPLY", style: TextStyle(fontWeight: FontWeight.bold,),),
                    subtitle: new Text("Join a programme today...", style: TextStyle(fontStyle: FontStyle.italic),),
                    onTap: () { Navigator.of(context).pushNamed("/b");},
                  ),
                  Divider(height: 1.0, color: Colors.black),
                  ListTile(
                    leading: new Image.asset("images/imag.png"),
                    title: new Text("ENTRY REQUIREMENTS", style: TextStyle(fontWeight: FontWeight.bold,),),
                    subtitle: new Text("What do you need to enter?...", style: TextStyle(fontStyle: FontStyle.italic),),
                    onTap: () { Navigator.of(context).pushNamed("/c");},
                  ),
                  Divider(height: 1.0, color: Colors.black),
                  ListTile(
                    leading: new Image.asset("images/searh.png"),
                    title: new Text("JOB PLACEMENT PORTAL", style: TextStyle(fontWeight: FontWeight.bold,),),
                    subtitle: new Text("Apply for a Job or our Summer Programme...", style: TextStyle(fontStyle: FontStyle.italic),),
                    onTap: () { Navigator.of(context).pushNamed("/e");},
                  ),
                  Divider(height: 1.0, color: Colors.black),
                  ListTile(
                    leading: new Image.asset("images/globe.png"),
                    title: new Text("HEART MAPS", style: TextStyle(fontWeight: FontWeight.bold,),),
                    subtitle: new Text("Come see where we are...", style: TextStyle(fontStyle: FontStyle.italic),),
                    onTap: () { Navigator.of(context).pushNamed("/f");},
                  ),
                  Divider(height: 1.0, color: Colors.black),
                  ListTile(
                    leading: new Image.asset("images/customer.png"),
                    title: new Text("CUSTOMER CARE", style: TextStyle(fontWeight: FontWeight.bold,),),
                    subtitle: new Text("Got Questions? We've got the answers!!...", style: TextStyle(fontStyle: FontStyle.italic),),
                    onTap: () { Navigator.of(context).pushNamed("/d");},
                  )

                ],
              ))
        ],
      )),
       floatingActionButton: SpeedDial(
         animatedIcon: AnimatedIcons.menu_close,
         animatedIconTheme: IconThemeData(size: 25.0),
         curve: Curves.bounceIn,
         backgroundColor: Colors.black,
         overlayColor: Colors.black,
         overlayOpacity: 0.2,
         onOpen: () => print('OPENING'),
         onClose: () => print('CLOSED'),
         tooltip: 'Social Dialer',
         heroTag: 'speed-dial-hero-tag',
         foregroundColor: Colors.white,
         elevation: 9.0,
         shape: CircleBorder(),
         children: [
           SpeedDialChild(
             child: Image.asset("images/whatsapp.png"),
             backgroundColor: Colors.green,
             elevation: 5.0,
             //label: 'Whatsapp',
             labelStyle: TextStyle(fontSize: 12.0),
             onTap: () { }
           ),
           SpeedDialChild(
               child: Image.asset("images/fb1.png"),
               backgroundColor: Colors.indigo,
               elevation: 5.0,
              // label: 'Facebook',
               labelStyle: TextStyle(fontSize: 12.0),
               onTap: () {Navigator.of(context).pushNamed("/j");}
           ),
           SpeedDialChild(
               child: Image.asset("images/twitter.png"),
               backgroundColor: Colors.lightBlueAccent,
               elevation: 5.0,
             //  label: '     Twitter',
               labelStyle: TextStyle(fontSize: 12.0),
               onTap: (){ Navigator.of(context).pushNamed("/i");}
           ),
           SpeedDialChild(
               child: Image.asset("images/insta.png"),
               backgroundColor: Colors.purple,
               elevation: 5.0,
              // label: 'Instagram',
               labelStyle: TextStyle(fontSize: 12.0),
               onTap: () { Navigator.of(context).pushNamed("/k");}
           )
         ],
       ),
    );
  }
}

//void whatsAppOpen() async {
//  bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");

//  if (whatsapp) {
//    await FlutterLaunch.launchWathsApp(phone: "8762797930", message: "Hello");
//  } else {
//    print("Whatsapp não instalado");
//  }
//}

