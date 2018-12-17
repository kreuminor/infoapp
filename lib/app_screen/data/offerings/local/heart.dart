import 'dart:async';
import 'dart:convert';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class FetchPage extends StatefulWidget {
  @override
  FetchPageState createState() => new FetchPageState();
}


class FetchPageState extends State<FetchPage> {


  TextEditingController controller = new TextEditingController();

  List data;

  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.teal,
  );

  Future<String> getData() async {

    final path = await getApplicationDocumentsDirectory();

    var response = await DefaultAssetBundle.of(context).loadString("local_json/offerings/heart.json");

    this.setState(() {
      var extractdata = json.decode(response);
      data = extractdata["Result"];
      print(data[0]["institutionName"]);

      for (Map data in extractdata["Result"]) {
        _offerings.add(Offerings.fromJson(data));
      }

    });

    return path.path;
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
                        child: new Container(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Text(_searchResult[i].offeringName, style: TextStyle(color: Colors.red, fontSize: 15.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text(_searchResult[i].institutionName, style: TextStyle(color: Colors.blue[700], fontSize: 15.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text(_searchResult[i].typeDescription1, style: TextStyle(fontSize: 15.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text("Start Date :  "+ _searchResult[i].startDate + "    " + "End Date : " + _searchResult[i].endDate, textAlign: TextAlign.left,),
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
                        child: new Container(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Text(_offerings[index].offeringName, style: TextStyle(color: Colors.red, fontSize: 15.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text(_offerings[index].institutionName, style: TextStyle(color: Colors.blue[700], fontSize: 15.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text(_offerings[index].typeDescription1, style: TextStyle(fontSize: 15.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text("Start Date :  "+ _offerings[index].startDate + "    " + "End Date : " + _offerings[index].endDate, textAlign: TextAlign.left,),
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

//------Dialog Box
class Dialog extends StatelessWidget {

  final Offerings offer;

  Dialog(this.offer);

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: Text(offer.offeringName, style: TextStyle(color: Colors.red, fontSize: 15.0), textAlign: TextAlign.center,),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("You seem interested in " + offer.offeringName + "?. If yes, select "
              "from the options below:", style: TextStyle(fontSize: 13.0),),
        ],
      ),
      actions: <Widget>[
        new RaisedButton(
          onPressed: (){
            Navigator.of(context).pushNamed("/w");
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



