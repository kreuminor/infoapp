import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData _themeData = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  accentColor: Colors.lime,
);

class  Refresh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _themeData.copyWith(
          accentColor: Colors.orange,
        ),
        child: Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        width: 300.0,
        height: 200.0,
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 10.0, right: 0.0, top: 15.0, bottom: 10.0)),
            new RaisedButton(
                child: const Text('         Updating Offerings          '),
                color: Theme.of(context).accentColor,
                elevation: 6.0,
                splashColor: Colors.white,
                onPressed: () {}),
            Divider(height: 3.0,),
            new RaisedButton(
                child: const Text('       Update Job Vacancies      '),
                color: Theme.of(context).accentColor,
                elevation: 6.0,
                splashColor: Colors.white,
                onPressed: () {}),
            Divider(height: 3.0,),
            new RaisedButton(
                child: const Text('Updating Contact Inforamtion'),
                color: Theme.of(context).accentColor,
                elevation: 6.0,
                splashColor: Colors.white,
                onPressed: () {}),
          ],
        ),

      ),
    )
    );
  }
}


