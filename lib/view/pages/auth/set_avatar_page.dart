import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode_app/controller/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../components/custom_button.dart';
import '../../style/style.dart';
import '../home/home_page.dart';

class SetAvatar extends StatefulWidget {
  const SetAvatar({Key? key}) : super(key: key);

  @override
  State<SetAvatar> createState() => _SetAvatarState();
}

class _SetAvatarState extends State<SetAvatar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    child: Container(
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
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  24.horizontalSpace,
                  Text("Upload your photo",
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
              24.verticalSpace,
              context.watch<AuthController>().imagePath.isEmpty
                  ? Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 23),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xff5A6CEA).withOpacity(0.08),
                                    blurRadius: 50,
                                    offset: Offset(12, 26))
                              ],
                              border: Border.all(color: Color(0xffEBEEF2)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.r))),
                          child: Center(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    context
                                        .read<AuthController>()
                                        .getImageCamera();
                                  },
                                  child: Container(
                                    height: 80.h,
                                    width: 80.w,
                                    padding: EdgeInsets.all(24),
                                    decoration: BoxDecoration(
                                        color:
                                            Color(0xffF43F5E).withOpacity(0.1),
                                        shape: BoxShape.circle),
                                    child:
                                        Image.asset('assets/image/camera.png'),
                                  ),
                                ),
                                10.verticalSpace,
                                Text(
                                  "Take photo",
                                  style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff09101D)),
                                )
                              ],
                            ),
                          ),
                        ),
                        24.verticalSpace,
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 23),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xff5A6CEA).withOpacity(0.08),
                                    blurRadius: 50,
                                    offset: Offset(12, 26))
                              ],
                              border: Border.all(color: Color(0xffEBEEF2)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.r))),
                          child: Center(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    context
                                        .read<AuthController>()
                                        .getImageGallery();
                                  },
                                  child: Container(
                                    height: 80.h,
                                    width: 80.w,
                                    padding: EdgeInsets.all(24),
                                    decoration: BoxDecoration(
                                        color:
                                            Color(0xffF43F5E).withOpacity(0.1),
                                        shape: BoxShape.circle),
                                    child: Image.asset('assets/image/file.png'),
                                  ),
                                ),
                                10.verticalSpace,
                                Text(
                                  "From gallery",
                                  style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff09101D)),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  : SizedBox.shrink(),
              context.watch<AuthController>().imagePath.isEmpty
                  ? SizedBox.shrink()
                  : Center(
                      child: Stack(
                        children: [
                          Container(
                            height: 250.h,
                            width: 250.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: FileImage(File(context
                                        .watch<AuthController>()
                                        .imagePath)),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Edit your photo"),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () async {
                                                  context
                                                      .read<AuthController>()
                                                      .getImageCamera();
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Take photo")),
                                            ElevatedButton(
                                                onPressed: () async {
                                                  context
                                                      .read<AuthController>()
                                                      .getImageGallery();
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Take file")),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  setState(() {});
                                                },
                                                child: Text("Cancel")),
                                          ],
                                        );
                                      });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8.r),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffF43F5E)),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
              Spacer(),
              InkWell(
                child: Container(
                    height: 55.r,
                    decoration: BoxDecoration(
                        gradient: Style.primaryPinkGradient,
                        borderRadius: BorderRadius.all(Radius.circular(32.r))
                    ),
                    child: Center(
                        child: Text("Next", style: Style.textStyleRegular(textColor: Style.whiteColor, size: 18),)
                    )
                ),
                onTap: () {
                  context.read<AuthController>().createUser(() {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const HomePage()),
                            (route) => false);
                  });
                },
              ),
            ],
          ),
        ));
  }
}
