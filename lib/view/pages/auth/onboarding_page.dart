import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode_app/view/pages/auth/sign_up_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/custom_button.dart';
import '../../style/style.dart';


class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/image/onboarding_background.png'), fit: BoxFit.cover)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Foode", style: Style.textStyleRegular(textColor: Style.whiteColor, size: 33)),
                4.verticalSpace,
                Text("The best food ordering and delivery app of the century", style: Style.textStyleThin(textColor: Style.whiteColor), textAlign: TextAlign.center,),
                40.verticalSpace,
                InkWell(
                  child: CustomButton(),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUp()));
                  },
                )
              ],
            ),
          ),
        )
    );
  }
}
