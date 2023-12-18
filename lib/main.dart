import 'package:flutter/material.dart';
import 'package:new_app/dynamic_image_slider/widget_image.dart';
import 'package:new_app/home.dart';
import 'package:new_app/some_screens/widget_image.dart';
import 'package:new_app/some_screens/widget_text.dart';
import 'package:new_app/some_screens/widget_video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: MyDashboard());
  }
}

class MyDashboard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text("Slider Example"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // WidgetImageSlider(),
            // ProductBar(),
            
            // WidgetImage1(),
            WidgetText(),
            // WidgetVideoPlayer(),
          ],
        ),
      )
    );
  }
}