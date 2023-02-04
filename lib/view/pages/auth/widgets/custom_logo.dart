import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/style.dart';

class CustomLogo extends StatelessWidget {
  final String text;
  const CustomLogo({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        68.verticalSpace,
        const SizedBox(
          height: 200,
          width: 210,
          child: Image(
            image: AssetImage('assets/image/splash_screen_logo.png'),
            fit: BoxFit.cover,
          ),
        ),
        18.verticalSpace,
        Text(
          text,
          style: Style.textStyleRegular(size: 23.sp),
        ),
        32.verticalSpace,
      ],
    );
  }
}
