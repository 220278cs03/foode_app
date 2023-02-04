import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';
import '../pages/home/home_page.dart';
import '../style/style.dart';

class CustomSignInButton extends StatefulWidget {
  const CustomSignInButton({Key? key}) : super(key: key);

  @override
  State<CustomSignInButton> createState() => _CustomSignInButtonState();
}

class _CustomSignInButtonState extends State<CustomSignInButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
            decoration: BoxDecoration(
                color: Style.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 50,
                      offset: const Offset(12, 26),
                      color: const Color(0xff5A6CEA).withOpacity(0.08))
                ]),
            child: context.watch<AuthController>().isFacebookLoading
                ? const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Logo(
                        Logos.facebook_logo,
                        size: 24,
                      ),
                      12.horizontalSpace,
                      Text("Facebook", style: Style.textStyleRegular()),
                    ],
                  ),
          ),
          onTap: () {
            context.read<AuthController>().loginFacebook(() {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                      (route) => false);
            });
          },
        ),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                border: Border.all(color: Style.halfBorder),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 50,
                      offset: const Offset(12, 26),
                      color: Style.shadowColor)
                ]),
            child: context.watch<AuthController>().isGoogleLoading
                ? const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Logo(
                        Logos.google,
                        size: 24,
                      ),
                      12.horizontalSpace,
                      Text("Google", style: Style.textStyleRegular()),
                    ],
                  ),
          ),
          onTap: () {
            context.read<AuthController>().loginGoogle(() {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                  (route) => false);
            });
          },
        ),
      ],
    );
  }
}
