import 'package:flutter/material.dart';
import 'package:zartek_test/view/widgets/food_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data for SaladCard generation
    List<String> saladData = ["Salad 1", "Salad 2", "Salad 3", "Salad 4", "Salad 5"];

    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                // Handle cart icon press
              },
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Container(
                width: MediaQuery.of(context).size.width / 3, // 1/3 of the screen width
                child: const Tab(text: "Tab 1"),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3, // 1/3 of the screen width
                child: const Tab(text: "Tab 2"),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3, // 1/3 of the screen width
                child: const Tab(text: "Tab 3"),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3, // 1/3 of the screen width
                child: const Tab(text: "Tab 4"),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3, // 1/3 of the screen width
                child: const Tab(text: "Tab 5"),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TabPage(tabIndex: 0),
            TabPage(tabIndex: 1),
            TabPage(tabIndex: 2),
            TabPage(tabIndex: 3),
            TabPage(tabIndex: 4),
          ],
        ),
      ),
    );
  }
}

class TabPage extends StatelessWidget {
  final int tabIndex;

  const TabPage({Key? key, required this.tabIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data for SaladCard generation
    List<String> saladData = ["Salad 1", "Salad 2", "Salad 3", "Salad 4", "Salad 5"];

    return ListView.builder(
      itemCount: saladData.length,
      itemBuilder: (context, index) {
        return SaladCard();  // Replace with your actual widget
      },
    );
  }
}
