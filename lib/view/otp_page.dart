// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:zartek_test/view/login_screen.dart';
import 'package:zartek_test/view_model/phone_auth_provider.dart';

class OtpPage extends StatefulWidget {
  final String mobile_number;
  const OtpPage({super.key, required this.mobile_number});

  @override
  State<OtpPage> createState() => OtpPageState();
}

class OtpPageState extends State<OtpPage> {
  TextEditingController otp_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          'OTP Verification',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 24.sp),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_rounded)),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 19.sp, right: 19.sp, bottom: 80.sp),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    Text(
                      'We are send verification code to',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 17.sp),
                    ),
                    Text(
                      '+91 ${widget.mobile_number}',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 17.sp),
                    ),
                    SizedBox(
                      height: 38.h,
                    ),
                    PinCodeTextField(
                      controller: otp_controller,
                      appContext: context,
                      length: 6,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        fieldHeight: 61.h,
                        fieldWidth: 53.w,
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        selectedColor: const Color.fromARGB(255, 77, 77, 77),
                        inactiveColor: const Color.fromARGB(255, 201, 201, 201),
                        activeColor: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      'Check text message for your OTP',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Didn’t get the OTP?',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 17.sp),
                        ),
                        Text(
                          'Resend SMS in 16s',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 157, 157, 157),
                              fontSize: 17.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    foregroundColor: WidgetStatePropertyAll(Colors.white)),
                onPressed: () {
                  PhoneAuth.submitOtp(context, otp_controller.text);
                },
                child: const Text("Submit OTP"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: Text(
                  'Go back to other login methods',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 17.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
