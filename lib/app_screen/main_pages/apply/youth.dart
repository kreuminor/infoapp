import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class Youth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          child: SingleChildScrollView(
            child: Html(
              data: """
          <hr/>
          <br>HOPE, an opportunity to transform your life by being engaged in a structured programme to LEARN core and technical skills.<br>
          <br>Through the Government of Jamaica's Housing Opportunity Production and Employment (HOPE) Initiative, participants are engaged in the National Service Corps programme over a one-year period.<br>
          <br>The National Service Corps (NSC) programme targets youth:<br>
          <ul><li>18-24 years</li><li>Not employed or enrolled in an approved institution</li><li>With or without CXC passes</li></ul>
          <br>We thank you for your interest in our programmes. <br>
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
                onPressed: () {Navigator.of(context).pushNamed("/x");})
          ],
        )
      ],

    );

  }
}
