import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode_app/controller/auth_controller.dart';
import 'package:foode_app/view/pages/auth/sign_in_page.dart';
import 'package:foode_app/view/pages/auth/verification_page.dart';
import 'package:foode_app/view/pages/auth/widgets/custom_checkBox.dart';
import 'package:foode_app/view/pages/auth/widgets/custom_error.dart';
import 'package:foode_app/view/pages/auth/widgets/custom_logo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/custom_button.dart';
import '../../components/custom_sign_in_button.dart';
import '../../components/custom_textformfield.dart';
import '../../style/style.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController controller;

  bool isPhoneEmpty = false;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            CustomLogo(
              text: 'Sign up for free',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Phone Number", style: Style.textStyleRegular()),
                    TextSpan(
                        text: "*",
                        style: Style.textStyleRegular(
                            textColor: Style.redColor, size: 14.sp))
                  ])),
                ),
                8.verticalSpace,
                TextFormField(
                  cursorColor: Style.blackColor,
                  controller: controller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Style.whiteColor,
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(100).r),
                        borderSide:
                            const BorderSide(color: Style.borderGreyColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(100).r),
                        borderSide:
                            const BorderSide(color: Style.borderGreyColor)),
                    errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(100).r),
                        borderSide:
                            const BorderSide(color: Style.borderGreyColor)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(100).r),
                        borderSide:
                            const BorderSide(color: Style.borderGreyColor)),
                    hintText: "Phone Number",
                    hintStyle:
                        Style.textStyleRegular(textColor: Style.textGreyColor),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  onChanged: (s) {
                    isPhoneEmpty = false;
                    if (s == "") isPhoneEmpty = true;
                    print(s);
                    print(isPhoneEmpty);
                    setState(() {});
                  },
                ),
                isPhoneEmpty
                    ? const CustomError(
                        text: 'Enter your Phone Number',
                      )
                    : const SizedBox.shrink(),
                22.verticalSpace,
                CustomCheckBox(),
                20.verticalSpace,
                InkWell(
                  child: CustomButton(
                    text: "Sign up",
                    on: !isPhoneEmpty,
                  ),
                  onTap: () {
                    if (controller.text.isEmpty) {
                      isPhoneEmpty = true;
                      setState(() {});
                    }
                    else{
                      context.read<AuthController>().sendSms(controller.text, () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const VerifyPage()));
                      });
                    }
                  },
                ),
              ],
            ),
            48.verticalSpace,
            Text("or continue with", style: Style.textStyleThin()),
            26.verticalSpace,
            const CustomSignInButton(),
            32.verticalSpace,
            GestureDetector(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Already have an account?",
                    style: Style.textStyleThin(textColor: Style.darkTextGrey)),
                TextSpan(
                    text: " Sign in",
                    style: Style.textStyleRegular(textColor: Style.primaryPink))
              ])),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SignInPage()));
              },
            ),
          ],
        ),
      ),
    ));
  }
}
