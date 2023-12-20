import 'package:flutter/material.dart';
import 'package:new_app/product_category/widget_product_view.dart';
import 'package:new_app/product_category/widget_popular_category.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text("Slider Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Expanded(
          //   // height: 300,
          //   child: ImageSlider(),
          // ),
          // WidgetImageSlider(),
          WidgetPopulorProduct(),
          WidgetPopulorCategory()
        ],
      )
    );
  }
}