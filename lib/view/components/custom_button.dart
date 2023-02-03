import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/style.dart';

class CustomButton extends StatefulWidget {
  String text;
  bool on;
  CustomButton({Key? key, this.text = "Next", this.on = true}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55.r,
        margin: EdgeInsets.only(bottom: 48),
        decoration: BoxDecoration(
            gradient: widget.on ? Style.primaryPinkGradient : Style.halfPinkGradient,
            borderRadius: BorderRadius.all(Radius.circular(32.r))
        ),
        child: Center(
            child: Text(widget.text, style: Style.textStyleRegular(textColor: Style.whiteColor, size: 18),)
        )
    );
  }
}
