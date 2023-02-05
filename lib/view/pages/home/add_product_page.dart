import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode_app/controller/product_controller.dart';
import 'package:foode_app/view/components/custom_textformfield.dart';
import 'package:foode_app/view/style/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController nameTextEditController = TextEditingController();
  final TextEditingController descTextEditController = TextEditingController();
  final TextEditingController priceTextEditController = TextEditingController();
  final TextEditingController newCategoryTextEditController =
  TextEditingController();
  final TextEditingController categoryTextEditController =
  TextEditingController();
  final TextEditingController typeEditController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductController>().getCategory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<ProductController>().isLoading
          ? const Center(child: CircularProgressIndicator(color: Style.primaryPink,))
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Add Product",
                style: GoogleFonts.sourceSansPro(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff09101D))),
            CustomTextFormField(
                controller: nameTextEditController, labelText: "Name", hintText: "Name", keyboardType: TextInputType.text,),
            CustomTextFormField(
                controller: descTextEditController, labelText: "Description", keyboardType: TextInputType.text, hintText: "Description",),
            CustomTextFormField(
              controller: priceTextEditController,
              labelText: "Price",
              keyboardType: TextInputType.number,
              hintText: "Price",
            ),
            Container(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Category",
                              style: Style.textStyleRegular()),
                          TextSpan(
                              text: "*",
                              style: Style.textStyleRegular(textColor: Style.redColor, size: 14.sp))
                        ])),
                  ),
                  8.verticalSpace,
                  DropdownButtonFormField(
                    value:
                    context.watch<ProductController>().listOfCategory.first,
                    items: context
                        .watch<ProductController>()
                        .listOfCategory
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (s) {
                      context
                          .read<ProductController>()
                          .setCategory(s.toString());
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Style.whiteColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all( Radius.circular(100).r),
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
                      hintStyle: Style.textStyleRegular(textColor: Style.textGreyColor),
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: CustomTextFormField(
                            labelText: "New Category",
                            controller: newCategoryTextEditController, keyboardType: TextInputType.text,
                          ),
                          actions: [
                            ElevatedButton(

                                onPressed: () {
                                  context
                                      .read<ProductController>()
                                      .addCategory(
                                      name:
                                      newCategoryTextEditController
                                          .text.toLowerCase(),
                                      onSuccess: () {
                                        Navigator.pop(context);
                                        context.read<ProductController>().getCategory();
                                      });
                                },
                                child: Text("Save"),
                              style: ElevatedButton.styleFrom(
                                primary: Style.primaryPink,
                              ),
                            )
                          ],
                        );
                      });
                },
                child: Text("Add Category"),
              style: ElevatedButton.styleFrom(
                primary: Style.primaryPink,)
            ),
            Container(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Category",
                              style: Style.textStyleRegular()),
                          TextSpan(
                              text: "*",
                              style: Style.textStyleRegular(textColor: Style.redColor, size: 14.sp))
                        ])),
                  ),
                  8.verticalSpace,
                  DropdownButtonFormField(
                    value: context.watch<ProductController>().listOfType.first,
                    items: context
                        .watch<ProductController>()
                        .listOfType
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (s) {
                      context.read<ProductController>().setType(s.toString());
                    },
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Style.whiteColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all( Radius.circular(100).r),
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
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<ProductController>().createProduct(
                      name: nameTextEditController.text,
                      desc: descTextEditController.text,
                      price: priceTextEditController.text);
                },
                child: context.watch<ProductController>().isSaveLoading
                    ? const CircularProgressIndicator(
                  color: Colors.white,
                )
                    : const Text("Save"),
                style: ElevatedButton.styleFrom(
                  primary: Style.primaryPink,)
            ),
            50.verticalSpace
          ],
        ),
      ),
    );
  }
}