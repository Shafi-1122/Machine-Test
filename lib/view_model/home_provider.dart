import 'package:flutter/foundation.dart';
import 'dart:convert'; // required to encode/decode json data
import 'package:http/http.dart' as http;
import 'package:zartek_test/model/menu_model.dart';

class HomeProvider extends ChangeNotifier {
  MenuModel? menu;
  bool isLoading = false;

  Future fetchData() async {
    isLoading = true;
    notifyListeners();
    final response = await http
        .get(Uri.parse('https://faheemkodi.github.io/mock-menu-api/menu.json'));
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      menu = MenuModel.fromJson(json.decode(response.body));
      isLoading = false;
      notifyListeners();
      // print(menu!.categories);
      return json.decode(response.body);
    } else {
      isLoading = false;
      notifyListeners();
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
