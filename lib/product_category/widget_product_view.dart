import 'package:flutter/material.dart';

class WidgetProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
          color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // color: Colors.black,
            margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Products",
                  style: TextStyle(fontSize: 20, color: Colors.brown.shade900),
                ),
                Text(
                  "View All",
                  style: TextStyle(fontSize: 18, color: Colors.brown.shade900),
                ),
              ],
            ),
          ),
          ProductListWidget(),
        ],
      ),
    );
  }
}

Widget ProductListWidget() {
  final List<String> productData = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];
  // Widget listItemProduct(context, List<Product> list)
  // {
  return Container(
      padding: EdgeInsets.fromLTRB(12, 0, 0, 12),
      height: 195,
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: productData.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
              child: Container(
                width: 130,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 221, 221, 221),
                    borderRadius: BorderRadius.circular(18.0),
                    border: Border.all(width: 1, color: Colors.blue)),
                margin: EdgeInsets.all(5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(2),
                              height: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/m4.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(6, 5, 6, 5),
                              alignment: Alignment.centerLeft,
                              child: Text(productData[index],
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.black)),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                              alignment: Alignment.centerLeft,
                              child: Text("22",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.black)),
                            ),
                          ])),
                ),
              ),
            );
          }));
}
