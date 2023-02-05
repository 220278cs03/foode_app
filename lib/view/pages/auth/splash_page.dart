import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode_app/view/pages/auth/sign_up_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/local_store/local_store.dart';
import '../home/home_page.dart';
import '../home/main_page.dart';
import 'onboarding_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String? docId = await LocalStore.getDocId();
      if (docId == null) {
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const SignUp()),
                (route) => false);
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const MainPage()),
                (route) => false);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: 428.w,
            height: 926.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage("assets/image/splash_screen_background.png"),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Center(
                  child: Image.asset('assets/image/splash_screen_logo.png')),
            )));
  }
}
