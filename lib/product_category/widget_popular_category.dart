import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/helper/util.dart';
import 'dart:convert';

import 'package:new_app/product_category/CategoryModel.dart';

class WidgetPopulorCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: rootBundle.loadString("assets/json/category.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> jsonData =
                json.decode(snapshot.data.toString());
            Category category = Category.fromJson(jsonData["Category"]);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                            fontSize: 20, color: Colors.brown.shade900),
                      ),
                      category.allVisible!
                          ? Text(
                              "View All",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.brown.shade900),
                            )
                          : Text(""),
                    ],
                  ),
                ),
                PopulorCategoryView(category),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error loading JSON'); // Handle error
          } else {
            return CircularProgressIndicator(); // Show a loading indicator
          }
        });
  }
}

class PopulorCategoryView extends StatelessWidget {
  Category category;
  PopulorCategoryView(this.category);

  @override
  Widget build(BuildContext context) {
    List<Items> listItems = [];
    category.items!.map((item) => {listItems.add(item)}).toList();

    Color imageBackgroundColor =
        Util.getColorFromHex(category.imageBackgroundColor!);
    Color textColor = Util.getColorFromHex(category.textColor!);
    Color viewBackgroundColor =
        Util.getColorFromHex(category.viewBackgroundColor!);

    return Container(
        height: 140,
        child: ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: category.items!.length,
            itemBuilder: (BuildContext context, int index) {
              print("myitem${category.items![index]}");
              return InkWell(
                onTap: () {},
                child: Container(
                  color: viewBackgroundColor,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: 100,
                  child: Column(children: [
                    Container(
                      width: 70,
                      height: 70,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      decoration: BoxDecoration(
                        color: imageBackgroundColor,
                        image: DecorationImage(
                            image: NetworkImage(listItems[index].imageLink!),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(category.imageRadius!),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(0, 10, 5, 0),
                      child: Text("${listItems[index].titleText!}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: textColor, fontSize: category.fontSize!)),
                    )
                  ]),
                ),
              );
            }));
  }
}
