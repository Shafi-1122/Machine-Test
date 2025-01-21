import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class GoogleButton extends StatefulWidget {
  const GoogleButton({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
    required this.BtnColor,
    required this.BorderRadius,
    required this.TitleColor,
    this.boxShadow,
  });
  final VoidCallback onTap;
  final String image;
  final String title;
  final Color BtnColor;
  final Color TitleColor;
  final BorderRadiusGeometry BorderRadius;
  final List<BoxShadow>? boxShadow;

  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}


class _GoogleButtonState extends State<GoogleButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //sized box changed to container
        Container(
          height: 50.sp,
          // width: 400.sp,
          width: double.infinity,
          decoration: BoxDecoration(boxShadow: widget.boxShadow
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.3),
              //     offset: const Offset(2, 2),
              //     blurRadius: 4,
              //   ),
              // ],
              ),
          child: ElevatedButton(
            onPressed: widget.onTap,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(widget.BtnColor),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Adjust radius as needed
                ),
              ),
            ),
            // style: ButtonStyle(
            //   backgroundColor: const WidgetStatePropertyAll(
            //       Color.fromARGB(255, 246, 246, 246)),
            //   shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            //       RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(8.r))),
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 13.sp, bottom: 13.sp),
                  child: Image(image: AssetImage(widget.image)),
                ),
                SizedBox(
                  width: 10.sp,
                ),
                Text(widget.title,
                    style: GoogleFonts.poppins(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                        color: widget.TitleColor))
              ],
            ),
          ),
        ),
      ],
    );
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

  }
}
