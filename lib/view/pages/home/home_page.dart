import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>()
        ..getBanners()
        ..getProduct()
        ..getCategory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/splash_screen_background.png'),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 34),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 36.h,
                        width: 36.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(32.r)),
                            image: DecorationImage(
                                image: AssetImage("assets/image/foode_logo.png"),
                                fit: BoxFit.cover)),
                      ),
                      24.horizontalSpace,
                      Text(
                        "Hello, $name !",
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff09101D)),
                      ),
                      Spacer(),
                      Container(
                        height: 44.h,
                        width: 44.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            color: Color(0xffF6F8FB),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 50,
                                  color: Color(0xff5A6CEA).withOpacity(0.08))
                            ]),
                        child: Center(
                            child: Icon(
                              Icons.notifications_active,
                              color: Color(0xffF43F5E),
                            )),
                      ),
                    ],
                  ),
                  34.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 316.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 50,
                                  offset: Offset(12, 26),
                                  color: Color(0xff5A6CEA).withOpacity(0.08))
                            ]),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                                  borderSide:
                                  BorderSide(color: Colors.transparent)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                                  borderSide:
                                  BorderSide(color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                                  borderSide:
                                  BorderSide(color: Colors.transparent)),
                              filled: true,
                              fillColor: Color(0xffF4F6F9),
                              hintText: "Search",
                              hintStyle: GoogleFonts.sourceSansPro(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff09101D)),
                              suffixIcon:
                              Icon(Icons.search, color: Color(0xff858C94)),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 9)),
                        ),
                      ),
                      Container(
                        height: 44.h,
                        width: 44.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            color: Color(0xffF43F5E).withOpacity(0.1),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 50,
                                  color: Color(0xff5A6CEA).withOpacity(0.08))
                            ]),
                        child: Center(
                            child: Icon(
                              Icons.filter_list,
                              color: Color(0xffF43F5E),
                            )),
                      ),
                    ],
                  ),
                  32.verticalSpace,
                  SizedBox(
                    height: 180.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 180.h,
                            width: 380.w,
                            padding:
                            EdgeInsets.only(top: 30, bottom: 14, right: 24),
                            margin: EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xffFF7E95),
                                  Color(0xffFF1843),
                                ]),
                                borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                            child: Row(
                              children: [
                                Container(
                                    height: 151.h,
                                    width: 166.w,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/image/hamburger.png'),
                                      fit: BoxFit.cover,
                                    )),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Special Deal for",
                                      style: GoogleFonts.sourceSansPro(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 23,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "December",
                                      style: GoogleFonts.sourceSansPro(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 23,
                                          color: Colors.white),
                                    ),
                                    12.verticalSpace,
                                    Container(
                                      height: 37,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32)),
                                          color: Color(0xffFFB800)),
                                      child: Center(
                                        child: Text(
                                          "Buy Now",
                                          style: GoogleFonts.sourceSansPro(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  32.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular restaurant",
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        "See all",
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffF43F5E)),
                      ),
                    ],
                  ),
                  32.verticalSpace,
                  SizedBox(
                    height: 184,
                    child: ListView.builder(
                        itemCount: listOfPopularRestaurant.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 184.h,
                            width: 160.w,
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(24)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 50,
                                    offset: Offset(12, 26),
                                    color: Color(0xff5A6CEA).withOpacity(0.08),
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 80.h,
                                    width: 80.w,
                                    child: Image(
                                        image: AssetImage("${listOfPopularRestaurant[index].image}")),
                                  ),
                                  Text(
                                    "${listOfPopularRestaurant[index].name}",
                                    style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Color(0xff09101D)),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    ("${listOfPopularRestaurant[index].time}"),
                                    style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xff858C94)),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  32.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular menu",
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        "See all",
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffF43F5E)),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: 32),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 88.h,
                            margin: EdgeInsets.only(bottom: 32),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(24)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 50,
                                    offset: Offset(12, 26),
                                    color: Color(0xff5A6CEA).withOpacity(0.08),
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, bottom: 12, left: 12, right: 22),
                              child: Row(
                                children: [
                                  Image(
                                      image: AssetImage(
                                          "assets/image/poplular_menu.png")),
                                  20.horizontalSpace,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Fresh Salad",
                                        style: GoogleFonts.sourceSansPro(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color: Color(0xff09101D)),
                                      ),
                                      4.verticalSpace,
                                      Text(
                                        "Cloudy Resto",
                                        style: GoogleFonts.sourceSansPro(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Color(0xff858C94)),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    "\$8",
                                    style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 29,
                                        color: Color(0xffF43F5E)),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.h),
          padding: EdgeInsets.all(24),
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
      ),
    );
  }
}
