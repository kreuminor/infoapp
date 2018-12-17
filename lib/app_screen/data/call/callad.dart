import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';


class CallAdPage extends StatefulWidget {
  @override
  CallAdPageState createState() => new CallAdPageState();
}

class CallAdPageState extends State<CallAdPage> {

  TextEditingController controller = new TextEditingController();

  List data;


  Future<String> getData() async {
    var response = await DefaultAssetBundle
        .of(context).loadString('local_json/contacts/contact.json');


    this.setState(() {

      var extractdata = json.decode(response);
      data = extractdata["Result"];

     // print(data[0]["InstitutionType"]);

      for (Map data in extractdata["Result"]) {

        if (data['InstitutionType']== "Admin Office" )
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
    return new Column(
            children: <Widget>[
              new Container(
                //color: Colors.blue,
                //height: 70.0,
                child: new Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: new Card(
                    color: Colors.white70,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(_searchResult[i].Institution, style: TextStyle(color: Colors.blue[700], fontSize: 16.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text("Address : "+_searchResult[i].Address, style: TextStyle(fontSize: 13.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text("Telephone :  "+ _searchResult[i].Telephone, textAlign: TextAlign.left,),
                          new Text(_searchResult[i].InstitutionType, textAlign: TextAlign.left,),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(_offerings[index].Institution, style: TextStyle(color: Colors.blue[700], fontSize: 16.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text("Address : "+_offerings[index].Address, style: TextStyle(fontSize: 13.0),),
                          Divider(height: 3.0, color: Colors.white,),
                          new Text("Telephone :  "+ _offerings[index].Telephone, textAlign: TextAlign.left,),
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
          );

  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _offerings.forEach((Offerings) {
      if (Offerings.Institution.contains(text) || Offerings.Institution.contains(text))
        _searchResult.add(Offerings);
    });

    setState(() {});
  }
}

List<Offerings> _searchResult = [];

List<Offerings> _offerings = [];


class Offerings {
  //final int id;
  final String Telephone, Institution, Address, InstitutionType;

  Offerings({this.Telephone, this.Address, this.Institution, this.InstitutionType});

  factory Offerings.fromJson(Map<String, dynamic> json) {
    return new Offerings(

        InstitutionType: json['InstitutionType'],
        Institution: json['Institution'],
        Address: json['Address'],
        Telephone: json['Telephone'],


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
      title: Text(offer.Institution, style: TextStyle(color: Colors.red, fontSize: 15.0),),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Do you want to make a call to " + offer.Telephone+ "?. If yes, click "
              "the call button below.", style: TextStyle(fontSize: 13.0),),
        ],
      ),
      actions: <Widget>[
        new RaisedButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          textColor: Colors.white,
          child: const Text('Call'),
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