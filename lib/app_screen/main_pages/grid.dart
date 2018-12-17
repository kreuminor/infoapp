import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  final String title;

  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.lime,

  );

  Grid(this.title);

  @override
  Widget build(BuildContext context) {
    var menu = ["HEART PROGRAMMES", "2","3","4"];
    return new Theme(
        data: _themeData.copyWith(
          primaryColor: Colors.white,
        ),
        child: Scaffold(
          appBar: new AppBar(
            title: new Text(title, style: TextStyle(color: Colors.black),),
          ),
          body: new Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 5.0, bottom: 0.0)),
              new Image.asset("images/training.png"),
              new Expanded(
                  child: new GridView.builder(
                      itemCount: menu.length,
                      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index){
                        return new GestureDetector(
                          child: new Card(
                            elevation: 5.0,
                            child: new Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                              child: new Text(menu[index]),
                            ),
                          ),
                          onTap: () {

                          },
                        );
                      })
              )
            ],
          ),
    )
    );
  }
}

