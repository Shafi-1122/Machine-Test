import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:zartek_test/view/login_screen.dart';
import 'package:zartek_test/view_model/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<AuthProvider>(context, listen: false);

    return DefaultTabController(
      length: 5, // Number of tabs
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    // Handle cart icon press
                  },
                ),
              ],
              bottom: const TabBar(
                isScrollable: true,
                tabs: [
                  Tab(text: "Tab 1"),
                  Tab(text: "Tab 2"),
                  Tab(text: "Tab 3"),
                  Tab(text: "Tab 4"),
                  Tab(text: "Tab 5"),
                ],
              ),
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Text(
                      'Menu',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Sign Out'),
                    onTap: () async {
                      bool value = await signInProvider.signOutFromGoogle();
                      if (value) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: "Failed to sign out. Please try again.",
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                Center(child: Text('Content for Tab 1')),
                Center(child: Text('Content for Tab 2')),
                Center(child: Text('Content for Tab 3')),
                Center(child: Text('Content for Tab 4')),
                Center(child: Text('Content for Tab 5')),
              ],
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
    ],
    child: MaterialApp(
      home: HomeScreen(),
    ),
  ));
}
