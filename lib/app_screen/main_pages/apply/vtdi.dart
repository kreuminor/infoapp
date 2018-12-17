import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class Vtdi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          child: SingleChildScrollView(
            child: Html(
              data: """
          <hr/>
          <br>For New Student and Staff: Student: Click Activate Account at the top menu and follow the instructions. Your username will be your student ID number. Staff: Enter the username and password that was sent to your email. You will be asked to reset your password when you first access the system.<br>
          <br>For Existing Students and Staff: Enter your username and password and click login. If you are having problems logging in, please contact your system administrator. You can also email our support team.<br>  
  """,
              padding: EdgeInsets.all(8.0),
            ),
          ),
        ),
        Divider(height: 20.0, color: Colors.white,),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 20.0, bottom: 0.0)),
            new RaisedButton(
                child: new Text("CLICK HERE TO APPLY"),
                padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0, bottom: 15.0),
                textColor: Colors.white,
                color: Colors.red[300],
                onPressed: () {Navigator.of(context).pushNamed("/z");})
          ],
        )
      ],

    );

  }
}
