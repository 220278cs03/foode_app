import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/style.dart';

class CustomTextFormField extends StatefulWidget {
  String? hintText;
  String? labelText;
  final String? obscuringCharacter;
  final Widget? suffixIcon;
  final Widget? prefixicon;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChange;
  final FocusNode? node;
  final bool? isObscure;
  final TextEditingController controller;
  CustomTextFormField({Key? key, this.hintText, this.labelText, required this.controller, this.obscuringCharacter, this.suffixIcon, this.prefixicon, required this.keyboardType, this.onChange, this.node,this.isObscure}) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
              BoxShadow(
              color: Color(0xff5A6CEA).withOpacity(0.08),
          blurRadius: 50,
          offset: Offset(12, 26))
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.labelText == null ? SizedBox.shrink() :
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: widget.labelText,
                      style: Style.textStyleRegular()),
                  TextSpan(
                      text: "*",
                      style: Style.textStyleRegular(textColor: Style.redColor, size: 14.sp))
                ])),
          ),
          8.verticalSpace,
          TextFormField(
            cursorColor: Style.blackColor,
            controller: widget.controller,
            onChanged: widget.onChange,
            decoration: InputDecoration(
              suffixIcon: widget.suffixIcon,
              filled: true,
              fillColor: Style.whiteColor,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(100).r),
                  borderSide: const BorderSide(color: Style.borderGreyColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(100).r),
                  borderSide: const BorderSide(color: Style.borderGreyColor)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(100).r),
                  borderSide: const BorderSide(color: Style.borderGreyColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(100).r),
                  borderSide: const BorderSide(color: Style.borderGreyColor)),
              hintText: widget.hintText,
              hintStyle: Style.textStyleRegular(textColor: Style.textGreyColor),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
