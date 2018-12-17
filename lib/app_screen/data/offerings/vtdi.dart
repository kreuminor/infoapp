import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class VtdiPage extends StatefulWidget {
  @override
  _VtdiPageState createState() => new _VtdiPageState();
}

class _VtdiPageState extends State<VtdiPage> {

  List data;
  TextEditingController controller = new TextEditingController();

  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blueGrey,
    accentColor: Colors.teal,
  );

  // Get json result and convert it to model. Then add
  Future<Null> getData() async {
    var response = await http.get(url);
    final responseJson = json.decode(response.body);

    setState(() {
      for (Map data in responseJson["Result"]) {
        _offerings.add(Offerings.fromJson(data));
      }

    });
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Theme (
        data: _themeData.copyWith(
          primaryColor: Colors.blueGrey,
        ),
        child:Scaffold(
          appBar: new AppBar(
            title: new Text('VTDI Programmes'),
            actions: <Widget>[
              new IconButton(icon: Icon(Icons.refresh, color: Colors.white,),
                  onPressed: () {getData(); print("Refreshed"); } )
            ],
            elevation: 0.0,
          ),
          body: new Column(
            children: <Widget>[
              new Container(
                color: Colors.blueGrey,
                child: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Card(
                    child: new ListTile(
                      leading: new Icon(Icons.search),
                      title: new TextField(
                        controller: controller,
                        decoration: new InputDecoration(
                            hintText: 'Search', border: InputBorder.none),
                        onChanged: onSearchTextChanged,
                      ),
                      trailing: new IconButton(icon: new Icon(Icons.cancel), onPressed: () {
                        controller.clear();
                        onSearchTextChanged('');
                      },),
                    ),
                  ),
                ),
              ),
              new Expanded(
                child: _searchResult.length != 0 || controller.text.isNotEmpty
                    ? new ListView.builder(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                  itemCount: _searchResult.length,
                  itemBuilder: (context, i) {
                    return new Card(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(_searchResult[i].programmename, style: TextStyle(color: Colors.red, fontSize: 16.0),),
                          Divider(height: 5.0, color: Colors.white,),
                          new Text(_searchResult[i].institutionname + " - " + _searchResult[i].campus, style: TextStyle(color: Colors.blue[700], fontSize: 15.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text(_searchResult[i].modality, style: TextStyle(fontSize: 15.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text("Start Date :  "+ _searchResult[i].startdate + "    " + "End Date : " + _searchResult[i].enddate, textAlign: TextAlign.left,),
                          Divider(height: 5.0, color: Colors.white,),
                        ],
                      ),
                    );
                  },
                )

                    : new ListView.builder(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                  itemCount: _offerings.length,
                  itemBuilder: (context, index) {
                    return new Card(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(_offerings[index].programmename, style: TextStyle(color: Colors.red, fontSize: 16.0),),
                          Divider(height: 5.0, color: Colors.white,),
                          new Text(_offerings[index].institutionname + " - " + _offerings[index].campus, style: TextStyle(color: Colors.blue[700], fontSize: 15.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text("Modality : "+_offerings[index].modality, style: TextStyle(fontSize: 15.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text("Start Date :  "+ _offerings[index].startdate + "    " + "End Date : " + _offerings[index].enddate, textAlign: TextAlign.left,),
                          Divider(height: 5.0, color: Colors.white,),
                        ],
                      ),
                      //margin: const EdgeInsets.all(0.0),
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.email),
              backgroundColor: Colors.blueGrey,
              onPressed: null),
        )
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _offerings.forEach((Offerings) {
      if (Offerings.programmename.contains(text.toUpperCase()) || Offerings.programmename.contains(text.toUpperCase()))
        _searchResult.add(Offerings);
    });

    setState(() {});
  }
}

List<Offerings> _searchResult = [];

List<Offerings> _offerings = [];

final String url = 'https://worldskillsjamaica.org/vtdi/service.asmx/getvtdiOffering';

class Offerings {
  //final int id;
  final String programmename, institutionname, campus, startdate, enddate, modality;

  Offerings({this.institutionname, this.programmename, this.campus, this.startdate, this.enddate, this.modality});

  factory Offerings.fromJson(Map<String, dynamic> json) {
    return new Offerings(
      //id: json['id'],
        programmename: json['programmename'],
        institutionname: json['institutionname'],
        campus: json['campus'],
        modality: json['modality'],
        startdate: json['startdate'],
        enddate: json['enddate']
    );
  }
}

