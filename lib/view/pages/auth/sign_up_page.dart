import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
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

  bool isCheckBox = false;

  // bool isHide = false; //visibility
  //
  // bool isEmailIncorrect = false; // access to enter
  // bool isPasswordIncorrect = false;
  //
  // bool isEmailEmpty = false; // to check either if it's empty
  // bool isPasswordEmpty = false;
  //
  // bool isPasswordValidate = false; // to check is there 8 elements
  //
  // String email = 'hello@gmail.com'; // Valid email & password
  // String password = '12345678';

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
            68.verticalSpace,
            SizedBox(
              height: 200,
              width: 210,
              child: Image(
                image: AssetImage('assets/image/splash_screen_logo.png'),
                fit: BoxFit.cover,
              ),
            ),
            18.verticalSpace,
            Text(
              "Sign up for free",
              style: Style.textStyleRegular(size: 23.sp),
            ),
            32.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  hintText: "Email or Phone Number",
                  labelText: "Email",
                ),
                // isEmailEmpty
                //     ? Container(
                //   margin: EdgeInsets.only(top:8),
                //   height: 33.r,
                //   decoration: BoxDecoration(
                //       color: Color(0xffEBEEF2),
                //       borderRadius:
                //       BorderRadius.all(Radius.circular(8.r))),
                //   child: Row(
                //     children: [
                //       Container(
                //         height: 16.r,
                //         width: 16.r,
                //         decoration: BoxDecoration(
                //             color: Color(0xff394452),
                //             shape: BoxShape.circle),
                //         child: Center(
                //             child: Text(
                //               "!",
                //               style: TextStyle(color: Colors.white),
                //             )),
                //       ),
                //       5.horizontalSpace,
                //       Text(
                //         "Enter your email",
                //         style: GoogleFonts.sourceSansPro(
                //             fontWeight: FontWeight.w400,
                //             fontSize: 14,
                //             color: Color(0xff394452)),
                //       )
                //     ],
                //   ),
                // )
                //     : SizedBox.shrink(),
                // isEmailIncorrect
                //     ? Container(
                //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //     margin: EdgeInsets.only(top:8),
                //     decoration: BoxDecoration(
                //         color: Color(0xffEBEEF2),
                //         borderRadius:
                //         BorderRadius.all(Radius.circular(8.r))),
                //     child: Row(
                //         children: [
                //           Container(
                //             height: 16.r,
                //             width: 16.r,
                //             decoration: BoxDecoration(
                //                 color: Color(0xff394452),
                //                 shape: BoxShape.circle),
                //             child: Center(
                //                 child: Text(
                //                   "!",
                //                   style: TextStyle(color: Colors.white),
                //                 )),
                //           ),
                //           5.horizontalSpace,
                //           Text("Invalid email",
                //               style: GoogleFonts.sourceSansPro(
                //                   fontWeight: FontWeight.w400,
                //                   fontSize: 14,
                //                   color: Color(0xff394452)))
                //         ])) : SizedBox.shrink(),
                20.verticalSpace,
                CustomTextFormField(
                  hintText: "Password",
                  labelText: "Password",
                ),
                // isPasswordEmpty
                //     ? Container(
                //   height: 33.r,
                //   decoration: BoxDecoration(
                //       color: Color(0xffEBEEF2),
                //       borderRadius:
                //       BorderRadius.all(Radius.circular(8.r))),
                //   child: Row(
                //     children: [
                //       Container(
                //         height: 16.r,
                //         width: 16.r,
                //         decoration: BoxDecoration(
                //             color: Color(0xff394452),
                //             shape: BoxShape.circle),
                //         child: Center(
                //             child: Text("!",
                //                 style: TextStyle(color: Colors.white))),
                //       ),
                //       5.horizontalSpace,
                //       isPasswordIncorrect
                //           ? Text("Invalid password",
                //           style: GoogleFonts.sourceSansPro(
                //               fontWeight: FontWeight.w400,
                //               fontSize: 14,
                //               color: Color(0xff394452)))
                //           : Text(
                //         "Enter your password",
                //         style: GoogleFonts.sourceSansPro(
                //             fontWeight: FontWeight.w400,
                //             fontSize: 14,
                //             color: Color(0xff394452)),
                //       )
                //     ],
                //   ),
                // )
                //     : SizedBox.shrink(),
                22.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          isCheckBox = !isCheckBox;
                          setState(() {});
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: 16.w,
                          height: 16.h,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.r)),
                              color: isCheckBox
                                  ? Style.whiteColor
                                  : Style.primaryPink,
                              border: Border.all(color: Style.primaryPink)),
                          child: Icon(
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
                ),
                20.verticalSpace,
                InkWell(
                    child: CustomButton(
                  text: "Sign up",
                  on: false,
                )),
              ],
            ),
            Text("or continue with", style: Style.textStyleThin()),
            26.verticalSpace,
            CustomSignInButton(),
            32.verticalSpace,
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Already have an account?",
                  style: Style.textStyleThin(textColor: Style.darkTextGrey)),
              TextSpan(
                  text: " Sign in",
                  style: Style.textStyleRegular(textColor: Style.primaryPink))
            ])),
          ],
        ),
      ),
    ));
  }
}
