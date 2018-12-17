import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class HeartPage extends StatefulWidget {
  @override
  _HeartPageState createState() => new _HeartPageState();
}

class _HeartPageState extends State<HeartPage> {

TextEditingController controller = new TextEditingController();

final ThemeData _themeData = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
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
        title: new Text('HEART Programmes'),
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
                      new Text(_searchResult[i].offeringName, style: TextStyle(color: Colors.red, fontSize: 15.0),),
                      Divider(height: 5.0, color: Colors.white,),
                      new Text(_searchResult[i].institutionName, style: TextStyle(color: Colors.blue[700], fontSize: 15.0),),
                      Divider(height: 3.0, color: Colors.white,),
                      new Text(_searchResult[i].typeDescription1, style: TextStyle(fontSize: 15.0),),
                      Divider(height: 3.0, color: Colors.white,),
                      new Text("Start Date :  "+ _searchResult[i].startDate + "    " + "End Date : " + _searchResult[i].endDate, textAlign: TextAlign.left,),
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
                      new Text(_offerings[index].offeringName, style: TextStyle(color: Colors.red, fontSize: 15.0),),
                      Divider(height: 5.0, color: Colors.white,),
                      new Text(_offerings[index].institutionName, style: TextStyle(color: Colors.blue[700], fontSize: 15.0),),
                      Divider(height: 3.0, color: Colors.white,),
                      new Text(_offerings[index].typeDescription1, style: TextStyle(fontSize: 15.0),),
                      Divider(height: 3.0, color: Colors.white,),
                      new Text("Start Date :  "+ _offerings[index].startDate + "    " + "End Date : " + _offerings[index].endDate, textAlign: TextAlign.left,),
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
      if (Offerings.offeringName.contains(text.toUpperCase()) || Offerings.offeringName.contains(text.toUpperCase()))
        _searchResult.add(Offerings);
    });

    setState(() {});
  }
}

List<Offerings> _searchResult = [];

List<Offerings> _offerings = [];

final String url = 'https://tms.heart-nta.org/htawebservice/getPrograminfo.asmx/Getprogrammeinfo?str=';

class Offerings {
  //final int id;
  final String offeringName, institutionName, typeDescription1, startDate, endDate;

  Offerings({this.institutionName, this.offeringName, this.typeDescription1, this.startDate, this.endDate});

  factory Offerings.fromJson(Map<String, dynamic> json) {
    return new Offerings(
      //id: json['id'],
      offeringName: json['offeringName'],
      institutionName: json['institutionName'],
      typeDescription1: json['typeDescription1'],
      startDate: json['startDate'],
      endDate: json['endDate']
    );
  }
}

