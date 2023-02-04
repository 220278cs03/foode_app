import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomError extends StatelessWidget {
  final String text;
  const CustomError({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Color(0xffEBEEF2),
          borderRadius:
          BorderRadius.all(Radius.circular(8.r))),
      child: Row(
        children: [
          Container(
            height: 16.r,
            width: 16.r,
            decoration: BoxDecoration(
                color: Color(0xff394452),
                shape: BoxShape.circle),
            child: Center(
                child: Text(
                  "!",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          5.horizontalSpace,
          Text(
            text,
            style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xff394452)),
          )
        ],
      ),
    );
  }
}
