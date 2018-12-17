import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class JobPage extends StatefulWidget {
  @override
  _JobPageState createState() => new _JobPageState();
}

class _JobPageState extends State<JobPage> {

  List data;
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
          primaryColor: Colors.black26,
        ),
        child:Scaffold(
          appBar: new AppBar(
            title: new Text('Job Programme'),
            actions: <Widget>[
              new IconButton(icon: Icon(Icons.refresh, color: Colors.white,),
                  onPressed: () {getData(); print("Refreshed"); } )
            ],
            elevation: 0.0,
          ),
          body: new Column(
            children: <Widget>[
              new Container(
                color: Colors.black26,
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
                          new Text(_searchResult[i].job, style: TextStyle(color: Colors.red, fontSize: 16.0),),
                          Divider(height: 5.0, color: Colors.white,),
                          new Text("Parish : "+_searchResult[i].parish, style: TextStyle(color: Colors.blue[700], fontSize: 15.0),),
                          new Text("Vacancies : "+_searchResult[i].Vacancies.toString(), style: TextStyle(color: Colors.blue[700], fontSize: 15.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          //new Text("Vacancies :  "+ _searchResult[i].Vacancies + "    " + "Firms : " + _searchResult[i].firms, textAlign: TextAlign.left,),
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
                          new Text(_offerings[index].job, style: TextStyle(color: Colors.red, fontSize: 16.0),),
                          Divider(height: 5.0, color: Colors.white,),
                          new Text("Parish : "+_offerings[index].parish, style: TextStyle(color: Colors.blue[700], fontSize: 15.0),),
                          new Text("Vacancies : "+_offerings[index].Vacancies.toString(), style: TextStyle(color: Colors.blue[700], fontSize: 15.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          //new Text("Vacancies :  "+ _offerings[index].Vacancies + "    " + "Firms : " + _offerings[index].firms, textAlign: TextAlign.left,),
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
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: IconThemeData(size: 25.0),
            curve: Curves.bounceIn,
            backgroundColor: Colors.black87,
            overlayColor: Colors.black,
            overlayOpacity: 0.1,
            onOpen: () => print('OPENING'),
            onClose: () => print('CLOSED'),
            tooltip: 'Social Dialer',
            heroTag: 'speed-dial-hero-tag',
            foregroundColor: Colors.white,
            elevation: 9.0,
            shape: CircleBorder(),
            children: [
              SpeedDialChild(
                  child: Icon(Icons.apps),
                  backgroundColor: Colors.amber,
                  elevation: 5.0,
                  label: 'Apply',
                  labelStyle: TextStyle(fontSize: 12.0),
                  onTap: () {Navigator.of(context).pushNamed("/n"); }
              ),
            ],
          ),
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
      if (Offerings.job.contains(text) || Offerings.job.contains(text))
        _searchResult.add(Offerings);
    });

    setState(() {});
  }
}

List<Offerings> _searchResult = [];

List<Offerings> _offerings = [];

final String url = 'https://worldskillsjamaica.org/vtdi/service.asmx/getJobVacany';

class Offerings {
  //final int id;
  final String job, parish;
  final int Vacancies, firms;

  Offerings({this.job, this.parish, this.Vacancies, this.firms});

  factory Offerings.fromJson(Map<String, dynamic> json) {
    return new Offerings(

        job: json['job'],
        parish: json['parish'],
        Vacancies: json['Vacancies'],
        firms: json['firms'],

    );
  }
}





