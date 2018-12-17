import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          child: SingleChildScrollView(
            child: Html(
              data: """
           <hr />
           <b>SUPERVISED SKILLED WORKER</b>
           <hr/>
           <br><b>Qualification Offered</b><br>
           <ul><li>CVQ/NVQ-J Level 2 Award or Certificate</li></ul>
           <br><b>Minimum Entry Requirements:</b><br>

  """,
              padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 0.0, top: 5.0),

            ),
          ),
        ),
        new Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          spacing: 10.0,
          children: <Widget>[
            Padding(padding: const EdgeInsets.only(left: 5.0)),
            new Container(
              padding: EdgeInsets.only(left: 10.0, right: 5.0, bottom: 5.0),
              child: new Text("i. If you have no qualification passes you will be given a grade 9 level Math and English Diagnostic Assessment",),
            ),
            new Container(
              padding: EdgeInsets.only(left: 10.0, right: 5.0),
              child: new Text("ii. Any of the following qualifications are accepted",),
            ),
            Divider(height: 15.0,),
            new Container(
              padding: EdgeInsets.only(left: 10.0, right: 5.0),
              child: new Table(
                border: TableBorder.all(width: 2.0, color: Colors.black),
                children: [
                  //--Row 1
                  TableRow(
                      children: [
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 35.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("Subject", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),),),],)),
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 35.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("Qualifications", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),),),],)),
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 35.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("Accepted Grades", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),),),],)),
                      ]),
                  //--Row 2
                  TableRow(
                      children: [
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("Any 1 Subject"),),],)),
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("CXC/CSEC"),),],)),
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("I-III or 1-3"),),],)),
                      ]),
                  //--Row 3
                  TableRow(
                      children: [
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text(""),),],)),
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("CAPE"),),],)),
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("I-IV or 1-5"),),],)),
                      ]),
                  //--Row 4
                  TableRow(
                      children: [
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text(""),),],)),
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("GCE"),),],)),
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("A-C"),),],)),
                      ]),
                  //--Row 5
                  TableRow(
                      children: [
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text(""),),],)),
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("SSC"),),],)),
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("3-5"),),],)),
                      ]),
                  //--Row 6
                  TableRow(
                      children: [
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text(""),),],)),
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("City & Guilds"),),],)),
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("Dist, Merit or Pass"),),],)),
                      ]),
                  //--Row 7
                  TableRow(
                      children: [
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("Math & English"),),],)),
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("JSC"),),],)),
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("Credit/Pass"),),],)),
                      ]),
                  //--Row 8
                  TableRow(
                      children: [
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text(""),),],)),
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("CCSLC"),),],)),
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("Mastery, Competent"),),],)),
                      ]),
                  //--Row 9
                  TableRow(
                      children: [
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("1 Skill Area"),),],)),
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("CVQ/NVQ-J Level 1"),),],)),
                        TableCell(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                              height: 25.0,
                              alignment: Alignment(0.0, 0.0),
                              child: new Text("Competent"),),],)),
                      ])
                ],
              ),
            ),
          ],
        ),
      ],
    );

  }
}