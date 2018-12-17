import 'package:flutter/material.dart';

class Adult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          children: [
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Text("ADULT CENTRES", style: new TextStyle(fontSize: 30.0),),
            //new Padding(padding: new EdgeInsets.all(20.0),),
            //new Icon(Icons.stars)
          ],
        ),
      ),
    );
  }
}