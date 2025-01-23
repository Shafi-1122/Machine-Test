import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zartek_test/view/home_screen.dart';
import 'package:zartek_test/view_model/auth_provider.dart';
import 'package:zartek_test/view_model/phone_auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  TextEditingController mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, value, child) {
          return Center(
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
                      showPhoneDialog(context);
                    },
                    icon: const Icon(Icons.phone, color: Colors.white),
                    label: const Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Verify with OTP",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () async {
                      // if (terms) {
                      // Show the loading dialog
                      // showAlertDialog(context);
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
                          // dismissAlertDialog(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                Username: userInfo['displayName']!,
                                PhotoUrl: userInfo['photoURL']!,
                                User_id: userInfo['uid']!,
                                // name: userInfo['displayName'] ?? '',
                                // email: userInfo['email'] ?? '',
                              ),
                            ),
                          );
                        } else {
                          // makeaLoader = false;
                          // dismissAlertDialog(context);
                          Fluttertoast.showToast(
                            msg: "Google sign-in failed. Please try again.",
                          );
                        }
                      } catch (e) {
                        // dismissAlertDialog(context);
                        print("Erorr on login $e");
                      }
                    },
                    icon: SizedBox(
                        height: 25,
                        width: 25,
                        child: Image.asset("assets/images.png")),
                    label: const Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Continue with google",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
                // Consumer<AuthProvider>(builder: (context, value, child) {
                //   return GoogleButton(
                //     onTap: () async {
                //       // if (terms) {
                //       // Show the loading dialog
                //       showAlertDialog(context);
                //       // makeaLoader = true;
                //       try {
                //         final Map<String, String?>? userInfo =
                //             await value.signInWithGoogle();
                //         if (userInfo != null) {
                //           Fluttertoast.showToast(
                //             msg:
                //                 "Signed in as ${userInfo['displayName']} (${userInfo['email']})",
                //           );
                //           // makeaLoader = false;
                //           dismissAlertDialog(context);
                //           Navigator.pushReplacement(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => const HomeScreen(
                //                   // name: userInfo['displayName'] ?? '',
                //                   // email: userInfo['email'] ?? '',
                //                   ),
                //             ),
                //           );
                //         } else {
                //           // makeaLoader = false;
                //           dismissAlertDialog(context);
                //           Fluttertoast.showToast(
                //             msg: "Google sign-in failed. Please try again.",
                //           );
                //         }
                //       } catch (e) {
                //         dismissAlertDialog(context);
                //         print("Erorr on login $e");
                //       }
                //     },
                //     image: 'assets/images.png',
                //     title: 'Continue with Google ',
                //     TitleColor: Colors.white,
                //     BtnColor: Colors.blue,
                //     BorderRadius: BorderRadius.all(Radius.circular(30.r)),
                //   );
                // }),
              ],
            ),
          );
        },
      ),
    );
  }

  dismissAlertDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  void showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white, // White background
      contentPadding: const EdgeInsets.all(16), // Add some padding
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

  showPhoneDialog(BuildContext context) {
    String phoneNumber = mobileController.text;
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        mobileController.clear();
        Navigator.pop(context); // Dismiss the dialog
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () {
        if (phoneNumber.length == 10 &&
            RegExp(r'^[0-9]{10}$').hasMatch(phoneNumber)) {
          // PhoneAuth.verifyPhoneNumber(context, phoneNumber);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please enter valid Number"),
            ),
          );
        }
        // Navigator.pop(context); // Dismiss the dialog
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Enter Your Details"),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
        child: Column(
          mainAxisSize: MainAxisSize.min, // Adjust to content height
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: mobileController,
                maxLength: 10,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile Number',
                ),
                onChanged: (text) {
                  setState(() {
                    // Handle changes here
                  });
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
