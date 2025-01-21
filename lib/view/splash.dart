import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zartek_test/view/home_screen.dart';
import 'package:zartek_test/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkingUser();
  }

//Checking the user sign in or not.
  Future<void> _checkingUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      if (prefs.getString('mail') == null) {
        if (kDebugMode) {
          print('User Not signed in ,id : ${prefs.getString('mail')}');
        }
        Timer(const Duration(seconds: 4), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const LoginScreen()), //If not Sign in navigating to Login page
          );
        });
      } else {
        if (kDebugMode) {
          print("This is mail ${prefs.getString('mail')}");
        }

        Timer(const Duration(seconds: 3), () {
          Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                  builder: (context) =>
                      HomeScreen())); //If sigh in Navigating to Home
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 195, 195, 195),
      body: Column(
        children: [
          Spacer(),
          Center(
              child: Icon(
            Icons.ac_unit_sharp,
            size: 70,
          )),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: const CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 16, 47, 6)),
            ),
          ),
        ],
      ),
    );
  }
}
