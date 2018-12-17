import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: SingleChildScrollView(
        child: Html(
          data: """
       <hr />
       <b>MINIMUM ENTRY REQUIREMENT</b>
       <hr/>
       <br>Each course has its own entry requirements. These depend on the level of the programme (Level 1-5), the type of course and your work experience.</br>     
       <br>As a guide, the basic  entry requirements for each level are set out. However, please note:  there may be additional requirements, depending on the programme.  For more information, help or advice, please contact our Customer Engagement Centre at:
           906-3487-9, 906-3613, 906-4530, 906-4831, 438-2422, 299-3862, 279-7930 or email us at info@heart-nta.org by using the purple FAB icon below<br>
       <br>Please scroll across to see the level's of qualifications.</br>

  """,
          padding: EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}

