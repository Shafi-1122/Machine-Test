import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zartek_test/view/home_screen.dart';
import 'package:zartek_test/view/widgets/cart_product_card.dart';
import 'package:zartek_test/view_model/cart_provider.dart';

class OrderSummaryScreen extends StatefulWidget {
  final String username;
  final String picUrl;
  final String id;

  const OrderSummaryScreen(
      {super.key,
      required this.username,
      required this.picUrl,
      required this.id});
  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
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
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SingleChildScrollView(
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
              children: [
                SizedBox(
                  height: 40,
                ),
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
                    child: Center(
                      child: Consumer<CartProvider>(
                          builder: (context, valuee, child) {
                        return Text(
                          " ${valuee.CartList.length} Dishes - ${valuee.CartList.length} Items ",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        );
                      }),
                    ),
                  ),
                ),
                Consumer<CartProvider>(builder: (context, valuee, child) {
                  if (valuee.CartList.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text('Cart is Empty, Please Add Your Products'),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 1.2,
                      child: ListView.builder(
                          itemCount: valuee.CartList.length,
                          itemBuilder: (context, index) {
                            return CartItemCard(
                              title: valuee.CartList[index]['dishName'],
                              price: valuee.CartList[index]['rate'].toString(),
                              calories:
                                  valuee.CartList[index]['calories'].toString(),
                              Quantity: valuee.CartList[index]['quantity'],
                              isVeg: true,
                              index: index,
                            );
                          }),
                    );
                  }
                }),
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
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                contentPadding: const EdgeInsets.all(16.0),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 60.0,
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      "Order Placed Successfully!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      "Thank you for your purchase. Your order is being processed.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.0, color: Colors.black54),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).pop();
                        setState(() {
                          Provider.of<CartProvider>(context, listen: false)
                              .CartList
                              .clear();
                        });
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(
                              Username: widget.username,
                              PhotoUrl: widget.picUrl,
                              User_id: widget.id,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text("OK"),
                    ),
                  ],
                ),
              ),
            );
            setState(() {});
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
