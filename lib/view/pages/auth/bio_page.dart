import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode_app/view/components/custom_textformfield.dart';
import 'package:foode_app/view/pages/auth/widgets/custom_error.dart';
import 'package:foode_app/view/pages/auth/set_avatar_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../controller/auth_controller.dart';
import '../../components/custom_button.dart';
import '../../style/style.dart';

class BioPage extends StatefulWidget {
  const BioPage({Key? key}) : super(key: key);

  @override
  State<BioPage> createState() => _BioPageState();
}

class _BioPageState extends State<BioPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String value = "Male";
  var items = ["Male", "Female"];

  String dateText = "";

  bool isFullNameEmpty = false;
  bool isUserNameEmpty = false;
  bool isEmailEmpty = false;
  bool isPasswordEmpty = false;
  bool isBirthEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Container(
                  height: 36.h,
                  width: 36.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(9.82.r)),
                      color: Color(0xffF43F5E).withOpacity(0.1)),
                  child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(Icons.arrow_back_ios,
                          color: Color(0xffF43F5E).withOpacity(0.7))),
                ),
                24.horizontalSpace,
                Text("Fill in your bio",
                    style: GoogleFonts.sourceSansPro(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff09101D))),
              ],
            ),
            30.verticalSpace,
            Text(
                "This data will be displayed in your account profile for security",
                style: GoogleFonts.sourceSansPro(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff09101D))),
            35.verticalSpace,
            CustomTextFormField(
              controller: nameController,
              keyboardType: TextInputType.text,
              hintText: "Full Name",
              labelText: "Full Name",
              onChange: (s){
                isFullNameEmpty = false;
                if(nameController.text == '')
                  isFullNameEmpty = true;
                setState(() {});
              },
            ),
            isFullNameEmpty ? CustomError(text: "Enter your Full Name") : SizedBox.shrink(),
            20.verticalSpace,
            CustomTextFormField(
              controller: userNameController,
              keyboardType: TextInputType.text,
              hintText: "User Name",
              labelText: "User Name",
              onChange: (s){
                isUserNameEmpty = false;
                if(userNameController.text == '')
                  isUserNameEmpty = true;
                setState(() {});
              },
            ),
                isUserNameEmpty ? CustomError(text: "Enter your User Name") : SizedBox.shrink(),
            20.verticalSpace,
            CustomTextFormField(
              controller: emailController,
              keyboardType: TextInputType.text,
              hintText: "Email",
              labelText: "Email",
              onChange: (s){
                isEmailEmpty = false;
                if(emailController.text == '')
                  isEmailEmpty = true;
                setState(() {});
              },
            ),
                isEmailEmpty ? CustomError(text: "Enter your Email") : SizedBox.shrink(),
            20.verticalSpace,
            CustomTextFormField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              hintText: "Password",
              labelText: "Password",
              onChange: (s){
                isPasswordEmpty = false;
                if(passwordController.text == '')
                  isPasswordEmpty = true;
                print(s);
                print(isPasswordEmpty);
                setState(() {});
              },
            ),
                isPasswordEmpty ? CustomError(text: "Enter your Password") : SizedBox.shrink(),
            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(text: "Gender", style: Style.textStyleRegular()),
                TextSpan(
                    text: "*",
                    style: Style.textStyleRegular(
                        size: 14, textColor: Style.redColor))
              ])),
            ),
            8.verticalSpace,
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color(0xff5A6CEA).withOpacity(0.08),
                    blurRadius: 50,
                    offset: Offset(12, 26))
              ]),
              child: DropdownButtonFormField(
                value: value,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100).r),
                      borderSide: BorderSide(color: Color(0xffEBEEF2))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100).r),
                      borderSide: BorderSide(color: Color(0xffEBEEF2))),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100).r),
                      borderSide: BorderSide(color: Color(0xffEBEEF2))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100).r),
                      borderSide: BorderSide(color: Color(0xffEBEEF2))),
                  hintText: 'Gender',
                  hintStyle:
                      Style.textStyleRegular(textColor: Style.textGreyColor),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                items: items
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (newValue) {
                  value = newValue!;
                  setState(() {});
                },
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Date of Birth", style: Style.textStyleRegular()),
                TextSpan(
                    text: "*",
                    style: Style.textStyleRegular(
                        size: 14, textColor: Style.redColor))
              ])),
            ),
            8.verticalSpace,
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color(0xff5A6CEA).withOpacity(0.08),
                    blurRadius: 50,
                    offset: Offset(12, 26))
              ]),
              child: TextFormField(
                controller: birthController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100).r),
                        borderSide: BorderSide(color: Color(0xffEBEEF2))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100).r),
                        borderSide: BorderSide(color: Color(0xffEBEEF2))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100).r),
                        borderSide: BorderSide(color: Color(0xffEBEEF2))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100).r),
                        borderSide: BorderSide(color: Color(0xffEBEEF2))),
                    hintText: 'dd/mm/yyyy',
                    hintStyle:
                        Style.textStyleRegular(textColor: Style.textGreyColor),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_month),
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now()
                                    .subtract(Duration(days: 50 * 365)),
                                lastDate: DateTime.now()
                                    .add(Duration(days: 50 * 365)))
                            .then((value) {
                          dateText = DateFormat("MMMM dd, yyyy")
                              .format(value ?? DateTime.now());
                          birthController.text = dateText;
                          setState(() {});
                        });
                      },
                    )),

              ),
            ),
                isBirthEmpty ? CustomError(text: "Enter your Date of Birth") : SizedBox.shrink(),
            20.verticalSpace,
            InkWell(child: CustomButton(), onTap: (){
              if(nameController.text.isEmpty){
                isFullNameEmpty = true;
                setState(() {});
              }
              else if(userNameController.text.isEmpty){
                isUserNameEmpty = true;
                setState(() {});
              }
              else if(emailController.text.isEmpty){
                isEmailEmpty = true;
                setState(() {});
              }
              else if(nameController.text.isEmpty){
                isFullNameEmpty = true;
                setState(() {});
              }else if(passwordController.text.isEmpty){
                isPasswordEmpty = true;
                setState(() {});
              }
              else if(birthController.text.isEmpty){
                isBirthEmpty = true;
                setState(() {});
              }
              else{
                context.read<AuthController>().setStateUser(
                    name: nameController.text,
                    username: userNameController.text,
                    password: passwordController.text,
                    email: emailController.text,
                    gender: value,
                    birth: birthController.text,
                    onSuccess: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => SetAvatar()),
                              (route) => false);
                    });
              }

            },),
            48.verticalSpace
          ]),
        ),
      ),
    );
  }
}
