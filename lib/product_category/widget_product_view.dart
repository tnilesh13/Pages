import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/helper/util.dart';
import 'package:new_app/product_category/ProductModel.dart';
import 'package:new_app/product_category/semi_circle.dart';

class WidgetPopulorProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: rootBundle.loadString("assets/json/product.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> jsonData =
                json.decode(snapshot.data.toString());
            Product product = Product.fromJson(jsonData["Product"]);

    Color containerBackgroundColor =
        Util.getColorFromHex(product.containerBackgroundColor!);
        
            return Container(
                    color: containerBackgroundColor,
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Products",
                          style: TextStyle(
                              fontSize: 20, color: Colors.brown.shade900),
                        ),
                        product.allVisible!
                            ? Text(
                                "View All",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.brown.shade900),
                              )
                            : Text(""),
                      ],
                    ),
                  ),
                  PopulorProductView(product),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error loading JSON'); // Handle error
          } else {
            return CircularProgressIndicator(); // Show a loading indicator
          }
        });
  }
}

class PopulorProductView extends StatelessWidget {
  Product product;
  PopulorProductView(this.product);

  @override
  Widget build(BuildContext context) {
    List<Items> listItems = [];
    product.items!.map((item) => {listItems.add(item)}).toList();

    Color imageBackgroundColor =
        Util.getColorFromHex(product.imageBackgroundColor!);
    Color textColor = Util.getColorFromHex(product.textColor!);
    Color viewBackgroundColor =
        Util.getColorFromHex(product.viewBackgroundColor!);

    return Container(
        padding: EdgeInsets.fromLTRB(12, 0, 0, 12),
        height: 215,
        child: ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: product.items!.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  width: 130,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                      color: viewBackgroundColor,
                      borderRadius: BorderRadius.circular(product.imageRadius!),
                      border: Border.all(width: 1, color: Colors.blue)),
                  margin: EdgeInsets.all(5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(product.imageRadius!),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.all(2),
                                height: 100,
                                decoration: BoxDecoration(
                                    color: imageBackgroundColor,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            listItems[index].imageLink!),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(6, 5, 6, 5),
                                alignment: Alignment.centerLeft,
                                child: Text("${listItems[index].titleText!}",
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: product.fontSize!)),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                                alignment: Alignment.centerLeft,
                                child: Text("${listItems[index].price!}",
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: product.fontSize!)),
                              ),
                            ])),
                  ),
                ),
              );
            }));
  }
}
