import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class JobLPage extends StatefulWidget {
  @override
  _JobLPageState createState() => new _JobLPageState();
}

class _JobLPageState extends State<JobLPage> {

  List data;
  TextEditingController controller = new TextEditingController();

  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.teal,
  );


  // Get json result and convert it to model. Then add
  Future<String> getData() async {
    var response = await DefaultAssetBundle
        .of(context).loadString('local_json/jobs/jobs.json');

    this.setState(() {
      var extractdata = json.decode(response);
      data = extractdata["Result"];
      print(data[0]["institutionName"]);

      for (Map data in extractdata["Result"]) {
        _offerings.add(Offerings.fromJson(data));
      }

    });

    return "Success!";
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
          primaryColor: Colors.amber[700],
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
                color: Colors.amber[700],
                child: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: new ListTile(
                      leading: new Icon(Icons.search),
                      title: new TextField(
                        controller: controller,
                        decoration: new InputDecoration(
                            hintText: 'Search', border: InputBorder.none),
                        onChanged: onSearchTextChanged,
                      ),
                      trailing: new IconButton(icon: new Icon(Icons.cancel, color: Colors.red,), onPressed: () {
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
                      child: new GestureDetector(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialog(_searchResult[i]),
                          );
                        },
                        child: Container(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Text(_searchResult[i].job, style: TextStyle(color: Colors.red, fontSize: 16.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text(_searchResult[i].Company, style: TextStyle(color: Colors.blue[700], fontSize: 15.0),),
                          new Text(_searchResult[i].CompanyAddress.toString(), style: TextStyle(fontSize: 13.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text("Vacancies :  "+ _searchResult[i].Vacancies.toString() , textAlign: TextAlign.left,),
                          Divider(height: 3.0, color: Colors.white,),
                        ],
                      ),
                    )
                    )
                    );
                  },
                )

                    : new ListView.builder(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                  itemCount: _offerings.length,
                  itemBuilder: (context, index) {
                    return new Card(
                      child: new GestureDetector(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialog(_offerings[index]),
                          );
                        },
                        child: Container(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Text(_offerings[index].job, style: TextStyle(color: Colors.red, fontSize: 16.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text(_offerings[index].Company, style: TextStyle(color: Colors.blue[700], fontSize: 15.0),),
                          new Text(_offerings[index].CompanyAddress.toString(), style: TextStyle(fontSize: 13.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text("Vacancies :  "+ _offerings[index].Vacancies.toString() , textAlign: TextAlign.left,),
                          Divider(height: 3.0, color: Colors.white,),
                        ],
                      ),
                      //margin: const EdgeInsets.all(0.0),
                    )
                    )
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
            backgroundColor: Colors.amber[700],
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
      if (Offerings.job.contains(text.toUpperCase()) || Offerings.job.contains(text.toUpperCase()))
        _searchResult.add(Offerings);
    });

    setState(() {});
  }
}

List<Offerings> _searchResult = [];

List<Offerings> _offerings = [];

class Offerings {
  //final int id;
  final String job, parish, Company, CompanyAddress;
  final int Vacancies, firms;

  Offerings({this.job, this.parish, this.Vacancies, this.firms, this.Company, this.CompanyAddress});

  factory Offerings.fromJson(Map<String, dynamic> json) {
    return new Offerings(

        job: json['job'],
        parish: json['parish'],
        Vacancies: json['Vacancies'],
        firms: json['firms'],
        Company: json['Company'],
        CompanyAddress: json['CompanyAddress'],
    );
  }
}

//------Dialog Box
class Dialog extends StatelessWidget {

  final Offerings offer;

  Dialog(this.offer);

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: Text(offer.job, style: TextStyle(color: Colors.red, fontSize: 15.0),),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Would you like to apply for " + offer.job+ "job?. If yes, click "
              "apply below.", style: TextStyle(fontSize: 13.0),),
        ],
      ),
      actions: <Widget>[
        new RaisedButton(
          onPressed: (){
            Navigator.of(context).pushNamed("/1");
          },
          textColor: Colors.white,
          child: const Text('Apply'),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Colors.white,
          child: const Text('Close'),
        ),
      ],
    );
  }
}





