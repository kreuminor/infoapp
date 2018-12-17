import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';


class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage> {

  List data;
  TextEditingController controller = new TextEditingController();

  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.teal,
  );

  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: _themeData.copyWith(
        primaryColor: Colors.lightGreen,
      ),
        child: Scaffold(
      appBar: new AppBar(title: new Text("HEART Map")),
      body: new FlutterMap(
          options: new MapOptions(center: new LatLng(18.1096, -77.2975),zoom: 8.0),
        layers: [
          new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']
          )
        ],

      )
      ),
    );
  }
}
