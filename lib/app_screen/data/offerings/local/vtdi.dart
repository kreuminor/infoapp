import 'dart:async';
import 'dart:convert';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/material.dart';


class VtdiLPage extends StatefulWidget {
  @override
  VtdiLPageState createState() => new VtdiLPageState();
}

class VtdiLPageState extends State<VtdiLPage> {

  TextEditingController controller = new TextEditingController();

  List data;

  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.teal,
  );

  Future<String> getData() async {
    var response = await DefaultAssetBundle
        .of(context).loadString('local_json/offerings/vtdi.json');

    this.setState(() {
      var extractdata = json.decode(response);
      data = extractdata["Result"];
      print(data[0]["programmename"]);

      for (Map data in extractdata["Result"]) {
        _offerings.add(Offerings.fromJson(data));
      }

    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }
  @override
  Widget build(BuildContext context) {
    return new Theme (
        data: _themeData.copyWith(
          primaryColor: Colors.cyan,
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
                color: Colors.cyan,
                child: new Padding(
                  padding: const EdgeInsets.all(5.0),
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
                          new Text(_searchResult[i].programmename, style: TextStyle(color: Colors.red, fontSize: 16.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text(_searchResult[i].institutionname + " - " + _searchResult[i].campus, style: TextStyle(color: Colors.blue[700], fontSize: 15.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text(_searchResult[i].modality, style: TextStyle(fontSize: 15.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text("Start Date :  "+ _searchResult[i].startdate + "    " + "End Date : " + _searchResult[i].enddate, textAlign: TextAlign.left,),
                          Divider(height: 5.0, color: Colors.white,),
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
                          new Text(_offerings[index].programmename, style: TextStyle(color: Colors.red, fontSize: 16.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text(_offerings[index].institutionname + " - " + _offerings[index].campus, style: TextStyle(color: Colors.blue[700], fontSize: 15.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text("Modality : "+_offerings[index].modality, style: TextStyle(fontSize: 15.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text("Start Date :  "+ _offerings[index].startdate + "    " + "End Date : " + _offerings[index].enddate, textAlign: TextAlign.left,),
                          Divider(height: 5.0, color: Colors.white,),
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
          ),
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

//------Dialog Box
class Dialog extends StatelessWidget {

  final Offerings offer;

  Dialog(this.offer);

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: Text(offer.programmename, style: TextStyle(color: Colors.red, fontSize: 15.0), textAlign: TextAlign.center,),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("You seem interested in " + offer.programmename + "?. If yes, select "
              "from the options below:", style: TextStyle(fontSize: 13.0),),
        ],
      ),
      actions: <Widget>[
        new RaisedButton(
          onPressed: (){
            Navigator.of(context).pushNamed("/z");
          },
          textColor: Colors.white,
          child: const Text('Apply'),
        ),
        new RaisedButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          textColor: Colors.white,
          child: const Text('Email'),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Colors.white,
          child: const Text('Close'),
        ),
      ],
      contentPadding: EdgeInsets.all(10.0),
    );
  }
}
