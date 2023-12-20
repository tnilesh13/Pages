import 'package:flutter/material.dart';
import 'package:new_app/helper/util.dart';
import 'package:new_app/helper/read_json.dart';

class WidgetImage1 extends StatefulWidget {
  const WidgetImage1({super.key});

  @override
  State<WidgetImage1> createState() => _WidgetImage1State();
}

class _WidgetImage1State extends State<WidgetImage1> {
  Map<dynamic, dynamic>? myMap;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ReadJsonFile.readJsonData(path: "assets/json/image.json").then((value) {
      setState(() {
        myMap = value["ImageView"];
        // print("myMapppp$myMap");
        // print("mytxtdesc${myMap["TextView"]["Description"]}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var textColor = Util.getColorFromHex(myMap!["TextView"]["FontColor"]);
    var bgColor = Util.getColorFromHex(myMap!["BackgroundColor"]);

    return Container(
        margin: EdgeInsets.all(myMap!["Margin"]),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(myMap!["Radius"]),
          color: bgColor,
        ),
        width: double.infinity,
        // color: bgColor,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(myMap!["Padding"]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(myMap!["Radius"]),
              child: Image.network(
                myMap!["Src"],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(myMap!["TextView"]["Padding"]),
            child: Text(
              myMap!["TextView"]["Description"],
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: myMap!["TextView"]['DescriptionFontSize']),
            ),
          )
        ]));
  }
}
