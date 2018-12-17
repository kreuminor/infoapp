import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:marquee_flutter/marquee_flutter.dart';

class Adult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          child: SingleChildScrollView(
            child: Html(
              data: """
       <hr />
       <br>The JFLL is an agency of the Ministry of Education, Youth & Information and is charged with the execution of adult and youth learning and lifelong learning interventions from basic literacy to the secondary level.<br>
       <br>It is also the lead agency of the GOJ in coordinating with local and international partners in the national drive to accomplish the National and international UNESCO goal of Education for All to support national economic and social development in the thrust towards Jamaica’s Vision 2030 goals<br></br>.
       <br>Use the list below to get more information on the programmes available</p>
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
                onPressed: () {Navigator.of(context).pushNamed("/y");})
          ],
        )
      ],

    );

  }
}
