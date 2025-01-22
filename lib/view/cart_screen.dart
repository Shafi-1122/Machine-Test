import 'package:flutter/material.dart';
import 'package:zartek_test/view/widgets/cart_product_card.dart';

class OrderSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Text(
          'Order Summary',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            width:
                MediaQuery.of(context).size.width, // Full width of the screen
            decoration: BoxDecoration(
              color: Colors.white, // Background color for the parent container
              borderRadius:
                  BorderRadius.circular(12), // Slight curve to the border
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), // Subtle shadow
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, 4), // Shadow below the container
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // Allow the column to take up only as much height as its children
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12),
                  child: Container(
                    width:
                        double.infinity, // Full width of the parent container
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0), // Padding for green container
                    // height: 100, // Custom height for the child container
                    decoration: BoxDecoration(
                      color: Colors
                          .green, // Green background color for the child container
                      borderRadius: BorderRadius.circular(
                          12), // Match the curve of the parent
                    ),
                    child: const Center(
                      child: Text(
                        '2 Dishes - 2 Items',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return CartItemCard(
                          title: 'Spinach Salad',
                          price: 'SAR 7.95',
                          calories: '15 calories',
                          description:
                              'Fresh spinach, mushrooms, and hard-boiled egg served with warm bacon vinaigrette',
                          isVeg: true,
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ), // Placeholder for order details
      floatingActionButton: Container(
        width: MediaQuery.of(context)
            .size
            .width, // Set the width to full screen width
        padding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 20), // Padding for the FAB
        child: FloatingActionButton(
          backgroundColor: Colors.green, // Green background
          onPressed: () {
            // Place order action
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Order Placed!")),
            );
          },
          child: const Text(
            'Place Order',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Set text color to white
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, // Center the FAB
    );
  }
}
