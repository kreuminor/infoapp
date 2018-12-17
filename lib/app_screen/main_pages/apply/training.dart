import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:heartinfo/app_screen/main_pages/apply/login/dummy/default_login_ndar.dart' as ndar;

class Heart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
    new Container(
    child: SingleChildScrollView(
    child: Html(
    data: """
       <hr />
       <br>You can apply at one of our Regional Offices or online via the website, for programmes currently being offered. For online applications you will need to have your:<br>
       <ul><li>Tax Registration Number (TRN)</li><li>An electronic passport size photograph</li></ul>
       <br>You can view the entry requirements by clicking the floating action button at the bottom of page and selecting the orange button. If you have any questions or problems, please send an email to for assistance. This can be done by clicking the red email icon button at the bottom of the page.</br>
      
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
                onPressed: () {Navigator.of(context).pushNamed("/w");})
          ],
        )
      ],

    );

  }
}

