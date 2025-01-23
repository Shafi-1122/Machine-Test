// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zartek_test/model/menu_model.dart';
import 'package:zartek_test/view_model/cart_provider.dart';

class SaladCard extends StatefulWidget {
  Dish dish;
  SaladCard({required this.dish});

  @override
  _SaladCardState createState() => _SaladCardState();
}

class _SaladCardState extends State<SaladCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (BuildContext context, CartProvider cartPro, Widget? child) {
        return Card(
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Veg_symbol.svg/2048px-Veg_symbol.svg.png'), // Replace with your image
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.dish.name.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Row(
                            children: [
                              Text("INR ${widget.dish.price}"),
                              const Spacer(),
                              Text(
                                  "${widget.dish.calories.toString()} calories"),
                              const SizedBox(
                                width: 8,
                              )
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 13.0, bottom: 10),
                            child: Text(
                              widget.dish.description,
                              style: const TextStyle(
                                  // fontSize: 16,
                                  color: Colors.grey),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors
                                  .green, // Set the background color to green
                              borderRadius: BorderRadius.circular(
                                  16), // Set a small border radius
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min, // Ensure the row only takes as much space as needed
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (quantity > 0) quantity--;
                                    });
                                    print("QTYY $quantity");
                                    cartPro.RemovingDish(
                                        dishName: widget.dish.name,
                                        rate: widget.dish.price,
                                        calories: widget.dish.calories,
                                        quantity: quantity,
                                        dish: widget.dish);
                                  },
                                ),
                                Text(
                                  '$quantity',
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                    });

                                    print("QTYY $quantity");
                                    cartPro.addDish(
                                        dishName: widget.dish.name,
                                        rate: widget.dish.price,
                                        calories: widget.dish.calories,
                                        quantity: quantity,
                                        dish: widget.dish);
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          widget.dish.customizationsAvailable
                              ? const Text(
                                  'Customizations Available',
                                  style: TextStyle(color: Colors.red),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    // Container(
                    //   width: 60,
                    //   height: 60,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(8.0),
                    //     image: DecorationImage(
                    //       image: NetworkImage(
                    //           widget.dish.imageUrl), // Replace with your image
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          widget
                              .dish.imageUrl, // Replace with your API image URL
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            return Image.asset(
                              'assets/erro_img.png', // Replace with your local error image
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
