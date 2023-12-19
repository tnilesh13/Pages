import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:new_app/product_category/ProductModel.dart';

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
                      Text(
                        "View All",
                        style: TextStyle(
                            fontSize: 18, color: Colors.brown.shade900),
                      ),
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

  // final List<String> productData = [
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  //   'Item 6',
  //   'Item 7',
  //   'Item 8',
  //   'Item 9',
  //   'Item 10',
  // ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
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
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              width: 100,
              child: Column(children: [
                Container(
                  width: 70,
                  height: 70,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        image: DecorationImage(
                            image: NetworkImage(""), fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(0, 10, 5, 0),
                      child: Text("${category.items![index]}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleSmall),
                    )
                  ]),
                ),
              );
            }));
  }
}
