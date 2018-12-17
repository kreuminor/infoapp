import 'dart:convert';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  final String title;

  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.black,
  );
  Test(this.title);

  List data;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Container(
          child: new Center(
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString('local_json/offerings/heart.json'),
                builder: (context, snapshot){
                  //Decode Json
                  var mydata = json.decode(snapshot.data.toString());

                  return new ListView.builder(
                      itemBuilder: (BuildContext content, int index){
                        return new Card(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              new Text("Institution: " +mydata[index]['institutionName']),
                              new Text("Type: " +mydata[index]['typeDescription1']),
                              new Text("Offering: " +mydata[index]['offeringName']),
                              new Text("Start Date : " +mydata[index]['startDate']),
                              new Text("End Date : " +mydata[index]['endDate'])
                            ],
                          ),
                        );
                      },
                    itemCount: mydata == null ? 0 : mydata.length,
                  );
                }
            ),
          ),
      ),


    );

  }
}