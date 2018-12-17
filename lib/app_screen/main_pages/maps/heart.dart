import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';


class Heartmap extends StatelessWidget {
  final String title;



  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.lime,
  );

  Heartmap(this.title);

  @override
  Widget build(BuildContext context) {

    MapController controller = new MapController();

    return new Theme(
      data: _themeData.copyWith(
        primaryColor: Colors.green[500],
      ),
        child: Scaffold(
      appBar: new AppBar(title: new Text(title)),
      body: new FlutterMap(
        mapController: controller,
          options: new MapOptions(center: new LatLng(18.1096, -77.2975),zoom: 8.0),
        layers: [
          new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
          new MarkerLayerOptions(
            markers: [
              //---HCCS
              new Marker(
                width: 65.0, height: 65.0,
                point: new LatLng(17.9772, -76.8671),
                builder: (context) => new Container(
                  child: IconButton(
                      icon: Icon(Icons.location_on),
                      color: Colors.red, iconSize: 35.0,
                      onPressed: (){showDialog( context: context,
                          builder: (BuildContext context) => _HCCS(context),
                        );}),)),
              //--HCH
              new Marker(
                width: 65.0, height: 65.0,
                point: new LatLng(18.457696, -77.320443),
                builder: (context) => new Container(
                  child: IconButton(icon: Icon(Icons.location_on),
                      color: Colors.red, iconSize: 35.0, onPressed: (){
                        showDialog( context: context,
                            builder: (BuildContext context) => _HCH(context),
                        );}),
                )
              ),
              //--HCBS
              new Marker(
                  width: 65.0, height: 65.0,
                  point: new LatLng(18.012145, -76.795254),
                  builder: (context) => new Container(
                    child: IconButton(icon: Icon(Icons.location_on),
                        color: Colors.red, iconSize: 35.0, onPressed: (){
                          showDialog( context: context,
                            builder: (BuildContext context) => _HCBS(context),
                          );}),
                  )
              ),
              //--HCIT
              new Marker(
                  width: 65.0, height: 65.0,
                  point: new LatLng(18.463821, -77.933296),
                  builder: (context) => new Container(
                    child: IconButton(icon: Icon(Icons.location_on),
                        color: Colors.red, iconSize: 35.0, onPressed: (){
                          showDialog( context: context,
                            builder: (BuildContext context) => _HCIT(context),
                          );}),
                  )
              ),
              //--Ebony
              new Marker(
                  width: 65.0, height: 65.0,
                  point: new LatLng(17.950851, -77.352850),
                  builder: (context) => new Container(
                    child: IconButton(icon: Icon(Icons.location_on),
                        color: Colors.red, iconSize: 35.0, onPressed: (){
                          showDialog( context: context,
                            builder: (BuildContext context) => _Ebony(context),
                          );}),
                  )
              )
            ])],)),);}
}

Widget _HCCS(BuildContext context) {
  return new AlertDialog(
    title: const Text('HEART College of Construction Services (HCCS)', style: TextStyle(color: Colors.red, fontSize: 15.0),),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Wateford, Waterford", style: TextStyle(fontSize: 13.0),),
        Text("Waterford P.O., St. Catherine", style: TextStyle(fontSize: 13.0),),
        Text("Telephone: (876) 988-1122, (876) 988-1135", style: TextStyle(fontSize: 13.0),),
        Text("Fax: (876) 988-4158", style: TextStyle(fontSize: 13.0),)
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),),],);
}

Widget _HCH(BuildContext context) {
  return new AlertDialog(
    title: const Text('HEART College of Hospitality (HCH)', style: TextStyle(color: Colors.red, fontSize: 15.0),),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("18 Ricketts Dr., Runaway Bay", style: TextStyle(fontSize: 15.0),),
        Text("Runaway Bay", style: TextStyle(fontSize: 15.0),),
        Text("Telephone: (876) 973-6868", style: TextStyle(fontSize: 13.0),),
        //Text("Fax: (876) 988-4158", style: TextStyle(fontSize: 13.0),)
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),),],);
}

Widget _HCBS(BuildContext context) {
  return new AlertDialog(
    title: const Text('HEART College of Beauty Services (HCBS)', style: TextStyle(color: Colors.red, fontSize: 15.0),),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("10 Hope Rd, Kingston", style: TextStyle(fontSize: 15.0),),
        Text("Kingston", style: TextStyle(fontSize: 15.0),),
        Text("Telephone: (876) 926-6639", style: TextStyle(fontSize: 13.0),),
        //Text("Fax: (876) 988-4158", style: TextStyle(fontSize: 13.0),)
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),),],);
}

Widget _HCIT(BuildContext context) {
  return new AlertDialog(
    title: const Text('HEART College of Innovation and Technology (HCIT)', style: TextStyle(color: Colors.red, fontSize: 15.0),),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("1–3 Pimento Way, Cazoumar Freezone,", style: TextStyle(fontSize: 15.0),),
        Text("Freeport Montego Bay", style: TextStyle(fontSize: 15.0),),
        //Text("Telephone: (876) 926-6639", style: TextStyle(fontSize: 13.0),),
        //Text("Fax: (876) 988-4158", style: TextStyle(fontSize: 13.0),)
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),),],);
}

Widget _Ebony(BuildContext context) {
  return new AlertDialog(
    title: const Text('Ebony Park HEART Academy', style: TextStyle(color: Colors.red, fontSize: 15.0),),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("1–3 Pimento Way, Cazoumar Freezone,", style: TextStyle(fontSize: 15.0),),
        Text("Freeport Montego Bay", style: TextStyle(fontSize: 15.0),),
        //Text("Telephone: (876) 926-6639", style: TextStyle(fontSize: 13.0),),
        //Text("Fax: (876) 988-4158", style: TextStyle(fontSize: 13.0),)
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),),],);
}
