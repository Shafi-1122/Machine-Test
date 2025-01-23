import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zartek_test/view_model/cart_provider.dart';

// ignore: must_be_immutable
class CartItemCard extends StatefulWidget {
  final String title;
  final String price;
  final String calories;
  int Quantity;
  final int index;
  final bool isVeg; // true for Veg, false for Non-Veg

  CartItemCard({
    required this.title,
    required this.price,
    required this.calories,
    required this.Quantity,
    required this.isVeg,
    required this.index,
  });

  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Veg/Non-Veg Indicator
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Veg_symbol.svg/2048px-Veg_symbol.svg.png'), // Replace with your image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color:
                              Colors.green, // Set the background color to green
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
                                  if (widget.Quantity > 0) widget.Quantity--;
                                });
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .dishRemoval(widget.Quantity, widget.index);
                              },
                            ),
                            Text(
                              " ${widget.Quantity} ",
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
                                  widget.Quantity++;
                                });
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .updateOrderCartList(
                                        widget.Quantity, widget.index);
                              },
                            ),
                          ],
                        ),
                      ),
                      Text((double.parse(widget.Quantity.toString()) *
                              double.parse(widget.price))
                          .toString()),
                    ],
                  ),
                  Text("INR " + widget.price),
                  Text(widget.calories + "Calories"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
