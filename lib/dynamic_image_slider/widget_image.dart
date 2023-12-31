import 'package:flutter/material.dart';
import 'package:new_app/dynamic_image_slider/SliderModel.dart';

class WidgetImage extends StatelessWidget {
  // Map<String, dynamic> imageee;
  SliderItems myData;
  WidgetImage(this.myData);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        myData.sliderLink!,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}