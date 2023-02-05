import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';

import 'account_page.dart';
import 'add_product_page.dart';
import 'home_page.dart';
import 'message_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;
  List<String> list = ["Home", "Basket", "Message", "Account"];

  List<IndexedStackChild> listOfPage = [
    IndexedStackChild(child: const HomePage()),
    IndexedStackChild(child: const ProductPage()),
    IndexedStackChild(child: const MessagePage()),
    IndexedStackChild(child: const AccountPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ProsteIndexedStack(
        index: currentIndex,
        children: listOfPage,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.h),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 50, color: Color(0xff5A6CEA).withOpacity(0.08)),
            ],
            border: Border.all(color: Color(0xffF4F6F9)),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int index = 0; index < list.length; index++)
              AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                      color: currentIndex == index
                          ? Color(0xffF43F5E).withOpacity(0.1)
                          : Colors.transparent),
                  padding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 9.5.h),
                  child: currentIndex == index
                      ? Row(
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        child: Image(
                          image: AssetImage(
                              "assets/image/${list[index]}.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      12.horizontalSpace,
                      SizedBox(
                        width: 44.w,
                        child: Text(
                          list[index],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFF1843)),
                        ),
                      )
                    ],
                  )
                      : GestureDetector(
                    onTap: () {
                      currentIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      height: 24,
                      width: 24,
                      child: Image(
                        image: AssetImage(
                            "assets/image/${list[index]}.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
