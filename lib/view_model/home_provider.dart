import 'package:flutter/foundation.dart';
import 'dart:convert'; // required to encode/decode json data
import 'package:http/http.dart' as http;
import 'package:zartek_test/model/menu_model.dart';

class HomeProvider extends ChangeNotifier {
  // Future<List<MenuModel>> tester = getData();

  // static Future<List<MenuModel>> getData() async {
  //   var url = Uri.parse("https://faheemkodi.github.io/mock-menu-api/menu.json");

  //   final response =
  //       await http.get(url, headers: {"Content-Type": "application/json"});
  //   final List body = json.decode(response.body);
  //   return body.map((e) => MenuModel.fromJson(e)).toList();
  // }
  List<MenuModel> Menus = [];
  Future fetchData() async {
    final response = await http
        .get(Uri.parse('https://faheemkodi.github.io/mock-menu-api/menu.json'));
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return json.decode(response.body);
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
