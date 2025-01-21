import 'package:flutter/material.dart';
import 'package:zartek_test/model/menu_model.dart';

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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const Row(
                        children: [
                          Text('SAR 7.95'),
                          Spacer(),
                          Text('15 calories'),
                          SizedBox(
                            width: 8,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 13.0, bottom: 10),
                        child: Text(
                          'Fresh spinach, mushrooms, and hard-boiled egg served with warm bacon vinaigrette',
                          style: TextStyle(
                              // fontSize: 16,
                              color: Colors.grey),
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
                                  if (quantity > 0) quantity--;
                                });
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
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        'Customizations Available',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjAMLedZRk2kc2Gg7NC0jRaHIjxa1-vf-b_A&s'), // Replace with your image
                      fit: BoxFit.cover,
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
  }
}
