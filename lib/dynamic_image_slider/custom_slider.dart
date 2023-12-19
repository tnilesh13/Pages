import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_app/dynamic_image_slider/SliderModel.dart';
import 'package:new_app/dynamic_image_slider/widget_image.dart';
import 'package:new_app/dynamic_image_slider/widget_image_with_text.dart';
import 'package:new_app/dynamic_image_slider/widget_image_with_text_button.dart';
import 'package:new_app/helper/util.dart';

class CustomSlider extends StatefulWidget {
  Sliders newSlider;
  Function(SliderItems) OnClick;
  CustomSlider(this.newSlider, this.OnClick);
  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  // late int bannerId;

  

  @override
  Widget build(BuildContext context) {
    var myBool = true;
    if (widget.newSlider.sliderViewType! == "Enlarge") {
      myBool = true;
    } else {
      myBool = false;
    }

    Color indicatorSelectedColor =
        Util.getColorFromHex(widget.newSlider.indicatorSelectedColor!);
    Color indicatorUnSelectedColor =
        Util.getColorFromHex(widget.newSlider.indicatorUnSelectedColor!);

    // double padding = double.parse(newSlider.padding!);
    List<Widget> carouselItems = widget.newSlider.items!.map((item) {
      // bannerId = item.sliderBannerUID!;
      if (item.sliderType == "Image") {
        return InkWell(
          onTap: widget.OnClick(item),
          child: WidgetImage(item));
      } else if (item.sliderType == "ImageWithText") {
        return WidgetImageWithText(item);
      } else {
        return WidgetImageWithTextButton(item);
      }
    }).toList();

    return Container(
      child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Stack(
            children: [
              InkWell(
                onTap: () {
                
                  // Navigator.push(context, MaterialPageRoute(builder:(context) => Test(bannerId)));
                },
                child: CarouselSlider(
                  
                  items: carouselItems,
                  
                  carouselController: carouselController,
                  options: CarouselOptions(
                    
                    // height: 270.0,
          
                    enlargeCenterPage: myBool,
                    autoPlay: widget.newSlider.autoPlay!,
                    aspectRatio: 16 / 9,
                    // autoPlayCurve: Curves.linear,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    enableInfiniteScroll: true,
                    viewportFraction: widget.newSlider.viewPortFraction!,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    }),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                    widget.newSlider.items!.asMap().entries.map((entry) {
                      return GestureDetector(
                          onTap: () =>
                              carouselController.animateToPage(entry.key),
                          child: Container(
                            width: currentIndex == entry.key ? 17 : 7,
                            height: 7,
                            // height: 7.0,
                            margin: const EdgeInsets.symmetric(horizontal: 3.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: currentIndex == entry.key
                                    ? indicatorSelectedColor
                                    : indicatorUnSelectedColor),
                          ),
                        );
                      }).toList(),
                    ))
              ],
            ),
        ));
  }
}