import 'package:flutter/material.dart';
import 'package:new_app/dynamic_image_slider/SliderModel.dart';
import 'package:new_app/dynamic_image_slider/test.dart';
import 'package:new_app/helper/util.dart';

class WidgetImageWithTextButton extends StatelessWidget {
  SliderItems myData;
  WidgetImageWithTextButton(this.myData);

  @override
  Widget build(BuildContext context) {
    Color buttonColor = Util.getColorFromHex(myData.sliderButtonColor!);
    return Container(
        child: Stack(
          children: [
            // Image.asset(
            //   imageee["image_path"],
            //   fit: BoxFit.cover,
            //   width: double.infinity,
            // ),
            Image.network(
              myData.sliderLink!,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Positioned(
              bottom: 70,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(myData.sliderText!,
                        style: const TextStyle(
                            backgroundColor: Colors.transparent,
                            color: Color.fromARGB(255, 243, 255, 21),
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              print("clicked");
                              print("my ${myData.sliderButtonClicked}");
                              myData.sliderButtonClicked;
                            },
                            child: Text(
                              myData.sliderButtonText!,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor),
                          )
                        ]),
                  ),
                ],
              )
            )
          ],
        ),
    );
  }
}