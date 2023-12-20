import 'package:flutter/material.dart';
import 'package:new_app/helper/util.dart';
import 'package:new_app/helper/read_json.dart';

class WidgetText extends StatefulWidget {
  const WidgetText({super.key});

  @override
  State<WidgetText> createState() => _WidgetTextState();
}

class _WidgetTextState extends State<WidgetText> {

  Map<dynamic, dynamic>? myMap;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ReadJsonFile.readJsonData(path: "assets/json/text.json").then((value) {
      setState(() {
        myMap = value["TextView"];
        print("myMapppp$myMap");
      });
    });
  }

  
  @override
  Widget build(BuildContext context) {
  var textColor = Util.getColorFromHex(myMap!["FontColor"]);
  var bgColor = Util.getColorFromHex(myMap!["BackgroundColor"]);

    return Container(
      margin: EdgeInsets.all(myMap!["Margin"]),
      width: double.infinity,
      color: bgColor,
      child: Padding(
        padding: EdgeInsets.all(myMap!["Padding"]),
        child: Column(
          children: [
            Text(myMap!["Text"], style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: myMap!['FontSize']),),
            Text(myMap!["Description"], style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: myMap!['DescriptionFontSize']),),
          ],
        ),
      ),
    );
            
  }
}