import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode_app/view/components/custom_button.dart';
import 'package:foode_app/view/components/custom_sign_in_button.dart';
import 'package:foode_app/view/components/custom_textformfield.dart';
import 'package:foode_app/view/pages/auth/widgets/custom_checkBox.dart';
import 'package:foode_app/view/pages/auth/widgets/custom_error.dart';
import 'package:foode_app/view/pages/auth/widgets/custom_logo.dart';
import 'package:provider/provider.dart';

import '../../../controller/auth_controller.dart';
import '../../style/style.dart';
import '../home/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  bool isPhoneEmpty = false;
  bool isPasswordEmpty = false;

  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
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
              CustomLogo(text: "Sign in to your account"),
              Column(
                children: [
                  CustomTextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      labelText: "Phone Number",
                      hintText: "Phone Number",
                      onChange: (s) {
                        isPhoneEmpty = false;
                        if (s == "") isPhoneEmpty = true;
                        setState(() {});
                      }),
                  isPhoneEmpty
                      ? const CustomError(
                    text: 'Enter your Phone Number',
                  )
                      : const SizedBox.shrink(),
                  20.verticalSpace,
                  CustomTextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.number,
                    labelText: "Password",
                    hintText: "Password",
                      onChange: (s) {
                        isPasswordEmpty = false;
                        if (s == "") isPasswordEmpty = true;
                        setState(() {});
                      }
                  ),
                  isPasswordEmpty
                      ? const CustomError(
                    text: 'Enter your Password',
                  )
                      : const SizedBox.shrink(),
                  22.verticalSpace,
                  CustomCheckBox(),
                  20.verticalSpace,
                  GestureDetector(
                    child: CustomButton(
                      text: "Sign in",
                      on: !isPasswordEmpty && !isPhoneEmpty,
                    ),
                    onTap: (){
                      if (phoneController.text.isEmpty) {
                        isPhoneEmpty = true;
                        setState(() {});
                      }
                      else if(passwordController.text.isEmpty){
                        isPasswordEmpty = true;
                        setState(() {});
                      }
                      else{
                        context
                            .read<AuthController>()
                            .login(phoneController.text, passwordController.text, () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => HomePage()),
                                  (route) => false);
                        });
                      }
                    },
                  ),
                  8.verticalSpace,
                  context.watch<AuthController>().errorText != null
                      ? Text(context.watch<AuthController>().errorText ?? "", style: Style.textStyleRegular(textColor: Style.primaryPink),)
                      : const SizedBox.shrink(),
                  20.verticalSpace,
                  Text("Forgot the password?",
                      style: Style.textStyleThin(textColor: Style.primaryPink)),
                  32.verticalSpace,
                  Text("or continue with", style: Style.textStyleThin()),
                  24.verticalSpace,
                  CustomSignInButton()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
