import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';


class JsonPage extends StatefulWidget {
  @override
  _JsonPageState createState() => new _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {

  final url = 'https://tms.heart-nta.org/htawebservice/getPrograminfo.asmx/Getprogrammeinfo?str=';

  bool downloading = false;
  var progressString = "";

  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.teal,
  );

  @override
  void initState() {
    super.initState();

    downloadJson();
  }

  Future<void> downloadJson() async{
    Dio dio = Dio();

   try{
     var dir = await getApplicationDocumentsDirectory();

     await dio.download(url, "${dir.path}/heart.json", onProgress: (rec,total){
       print("Rec: $rec, Total: $total");

       setState(() {
         downloading = true;
         progressString = ((rec/total)*100).toStringAsFixed(0)+"%";
       });

     });
     }catch(e){
     print(e);
   }

   setState(() {
     downloading = false;
     progressString = "Done";
   });
   print("Download finished");
  }
  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _themeData.copyWith(
          accentColor: Colors.orange,
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Shhhhh"),
          ),
          body: Center(
            child: downloading
                ? Container(
              height: 120.0,
              width: 200.0,
              child: Card(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(height: 20.0,),
                    Text("Downloading:... $progressString ", style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            )
                :Text("No Data"),
            ),
        )
    );
  }
}


