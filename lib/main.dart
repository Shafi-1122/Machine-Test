import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zartek_test/view/login_screen.dart';
// import 'package:zartek_test/providers/auth_provider.dart';

import 'view_model/auth_provider.dart'; // Import your AuthProvider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(), // Provide the AuthProvider here
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen(), // Your login screen
      ),
    );
  }
}
