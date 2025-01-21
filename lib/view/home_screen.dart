import 'package:flutter/material.dart';
import 'package:zartek_test/model/menu_model.dart';
import 'package:zartek_test/view/cart_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:zartek_test/view/login_screen.dart';
import 'package:zartek_test/view/widgets/food_card.dart';
import 'package:zartek_test/view_model/auth_provider.dart';
import 'package:zartek_test/view_model/home_provider.dart';

class HomeScreen extends StatefulWidget {
  final String Username;
  final String PhotoUrl;
  final String User_id;
  const HomeScreen(
      {super.key,
      required this.Username,
      required this.PhotoUrl,
      required this.User_id});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
// HomeProvider homeProvider=HomeProvider()
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).fetchData();
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    // Sample data for SaladCard generation
    List<String> saladData = [
      "Salad 1",
      "Salad 2",
      "Salad 3",
      "Salad 4",
      "Salad 5"
    ];
    final authPro = Provider.of<AuthProvider>(context, listen: false);
    return Consumer<HomeProvider>(
      builder: (context,value,child) {
        if(value.isLoading){
          return Center(child: CircularProgressIndicator(),);
        } else{
          return DefaultTabController(
          length: value.menu!.categories.length, // Number of tabs
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
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  OrderSummaryScreen(
                                      // name: userInfo['displayName'] ?? '',
                                      // email: userInfo['email'] ?? '',
                                      ),
                                ),
                              );
                    // Handle cart icon press
                  },
                ),
              ],
              bottom: TabBar(
                isScrollable: true,
                tabs: value.menu!.categories.map((category) {
            return Container(
              width: MediaQuery.of(context).size.width / 3, // 1/3 of the screen width
              child: Tab(text: category.name), // Use category from the provider
            );
          }).toList(),
        )
            ),
            drawer: SafeArea(
              child: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero, // Remove any default padding
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          CircleAvatar(
                            radius: 40, // Profile image size
                            backgroundImage: NetworkImage(widget
                                .PhotoUrl), // Replace with the user's image URL
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.Username,
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "User id: ${widget.User_id.substring(0, 5)}", // Replace with the actual user ID or data
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    // Sign Out button
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Sign Out'),
                      onTap: () async {
                        bool valueue = await authPro.signOutFromGoogle();
                        if (valueue) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
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
            ),
            body:  TabBarView(
                    children: [
                      TabPage(tabIndex: 0,prov: value,),
                      TabPage(tabIndex: 1,prov: value),
                      TabPage(tabIndex: 2,prov: value),
                      TabPage(tabIndex: 3,prov: value),
                      TabPage(tabIndex: 4,prov: value),
                    ],
                  )
               
          ),
        );
        }
        
      }
    );
  }
}

class TabPage extends StatelessWidget {
  final int tabIndex;
  final HomeProvider prov;

  const TabPage({Key? key, required this.tabIndex,required this.prov}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data for SaladCard generation
    List<Dish> saladData = prov.menu!.categories[tabIndex].dishes;

    return ListView.builder(
      itemCount: saladData.length,
      itemBuilder: (context, index) {
        return SaladCard(dish: saladData[index],); // Replace with your actual widget
      },
    );
  }
}
