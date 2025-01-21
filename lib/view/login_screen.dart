import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zartek_test/view/home_screen.dart';
import 'package:zartek_test/view/widgets/google_button.dart';
import 'package:zartek_test/view_model/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  // Add your OTP verification logic here
                },
                icon: Icon(Icons.phone, color: Colors.white),
                label: const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Verify with OTP",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
            ),
            Consumer<AuthProvider>(builder: (context, value, child) {
              return GoogleButton(
                onTap: () async {
                  // if (terms) {
                  // Show the loading dialog
                  showAlertDialog(context);
                  // makeaLoader = true;
                  try {
                    final Map<String, String?>? userInfo =
                        await value.signInWithGoogle();
                    if (userInfo != null) {
                      Fluttertoast.showToast(
                        msg:
                            "Signed in as ${userInfo['displayName']} (${userInfo['email']})",
                      );
                      // makeaLoader = false;
                      dismissAlertDialog(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(
                              // name: userInfo['displayName'] ?? '',
                              // email: userInfo['email'] ?? '',
                              ),
                        ),
                      );
                    } else {
                      // makeaLoader = false;
                      dismissAlertDialog(context);
                      Fluttertoast.showToast(
                        msg: "Google sign-in failed. Please try again.",
                      );
                    }
                  } catch (e) {
                    dismissAlertDialog(context);
                    print("Erorr on login $e");
                  }
                },
                image: 'assets/images.png',
                title: 'Continue with Google ',
                TitleColor: Colors.white,
                BtnColor: Colors.blue,
                BorderRadius: BorderRadius.all(Radius.circular(30.r)),
              );
            }),
          ],
        ),
      ),
    );
  }
  
  dismissAlertDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  void showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white, // White background
      contentPadding: EdgeInsets.all(16), // Add some padding
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero, // Remove corner radius
      ),
      content: Row(
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color(0XFF1C2660)), // Customize color
          ),
          SizedBox(width: 10.sp), // Space between indicator and text
          Text(
            "Checking Credentials",
            style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );

    // Show the dialog
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismiss on outside tap
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
