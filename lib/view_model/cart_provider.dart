import 'package:flutter/material.dart';
import 'package:zartek_test/model/menu_model.dart';

class CartProvider extends ChangeNotifier {
  List CartList = [];

  // void _incrementCounter(
  //   int index,
  // ) {
  //   FoodsList[index].quantity++;
  //   //counter++;

  //   print("New object ${FoodsList[index].quantity}");
  //   // FoodsList.insert(
  //   //     index, FoodsList[index].quantity as fooddetails); //insert from here
  //   updateOrderCartList(FoodsList[index].quantity, index);

  //   notifyListeners();
  // }

  // void addDish(
  //     {required String dishName,
  //     required String rate,
  //     required int calories,
  //     required int quantity}) {
  //   // Check if the dish is already in the CartList

  //   if (CartList.isNotEmpty) {
  //     alreadyIn = CartList.any((dish) => dish['dishName'] == dishName);
  //     if (alreadyIn == true) {
  //       // print("Dish is already added $dishName");
  //       int index = CartList.indexWhere((map) => map['dishName'] == dishName);

  //       if (index != -1) {
  //         print('Index of $dishName: $index');
  //         updateOrderCartList(quantity, index);
  //         notifyListeners();
  //         // Map<String, dynamic> dishes = CartList[index];
  //         print('updated ::: $CartList');
  //       }
  //     }
  //   } else {
  //     Map<String, dynamic> DishData = {
  //       'dishName': dishName,
  //       'rate': rate,
  //       'calories': calories,
  //       'quantity': quantity
  //     };

  //     CartList.add(DishData);
  //     notifyListeners();
  //   }

  //   print("Cart List : $CartList");
  // }

  void addDish(
      {required String dishName,
      required String rate,
      required int calories,
      required int quantity,
      required Dish dish}) {
    // Check if the dish is already in the CartList

    if (CartList.isNotEmpty) {
      bool alreadyIn = false;
      for (dynamic food in CartList) {
        String foodname = food['dishName'];
        if (foodname == dish.name) {
          print("This foodname is already in this list $foodname");
          alreadyIn = true;
          break; // No need to continue checking once the food is found
        }
      }
      if (!alreadyIn) {
        print("The food is not in the list");
        Map<String, dynamic> DishData = {
          'dishName': dishName,
          'rate': rate,
          'calories': calories,
          'quantity': quantity
        };
        CartList.add(DishData);
        notifyListeners();
        print('Order Cart List From !alreadyIn ${CartList}');
      } else {
        int index = CartList.indexWhere((map) => map['dishName'] == dishName);

        if (index != -1) {
          print('Index of $dishName: $index');
          updateOrderCartList(quantity, index);
          notifyListeners();
        }
      }
    } else {
      Map<String, dynamic> DishData = {
        'dishName': dishName,
        'rate': rate,
        'calories': calories,
        'quantity': quantity
      };

      CartList.add(DishData);
      notifyListeners();
    }

    print("Cart List : $CartList");
  }

  void updateOrderCartList(int updatedQuantity, int index) {
    // print("quantii $updatedQuantity");
    print('index inside function $index');
    Map<String, dynamic> existingCartItem = CartList[index];
    existingCartItem['quantity'] = updatedQuantity;
    print("New Updated Order Cart list ${existingCartItem}");
    notifyListeners();
  }

  void RemovingDish(
      {required String dishName,
      required String rate,
      required int calories,
      required int quantity,
      required Dish dish}) {
    // Check if the dish is already in the CartList
    if (CartList.isNotEmpty) {
      int index = CartList.indexWhere((map) => map['dishName'] == dishName);
      if (quantity > 0) {
        if (index != -1) {
          // print('Index of $dishName: $index');
          updateOrderCartList(quantity, index);
          notifyListeners();
        }
      } else {
        // print("Index $index");
        CartList.removeAt(index);
        print("Item removed. Now Cart List ${CartList}");
        notifyListeners();
      }
    } else {
      print("Cart List : $CartList");
    }
  }
}
