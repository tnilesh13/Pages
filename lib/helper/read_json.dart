import 'dart:convert';

import 'package:flutter/services.dart' as root_bundle;


class ReadJsonFile {
  static Future<Map> readJsonData({required String path}) async {

    final jsonData = await root_bundle.rootBundle.loadString(path);

    var list = json.decode(jsonData) as Map;

    // print("listtt$list");

    return list;
  }
}   