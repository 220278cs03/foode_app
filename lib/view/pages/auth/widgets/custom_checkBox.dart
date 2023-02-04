import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/style.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({Key? key}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {

  bool isCheckBox = false;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              isCheckBox = !isCheckBox;
              setState(() {});
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 16.w,
              height: 16.h,
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.all(Radius.circular(4.r)),
                  color: isCheckBox
                      ? Style.whiteColor
                      : Style.primaryPink,
                  border: Border.all(color: Style.primaryPink)),
              child: const Icon(
                Icons.done,
                size: 14,
                color: Style.whiteColor,
              ),
            ),
          ),
          12.horizontalSpace,
          Text(
            "Remember me",
            style: Style.textStyleRegular(size: 14),
          )
        ],
      ),
    );
  }
}
