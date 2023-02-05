import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode_app/view/components/custom_textformfield.dart';
import 'package:foode_app/view/pages/home/product_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_controller.dart';
import '../../../controller/local_store/local_store.dart';
import '../../style/style.dart';
import '../auth/splash_page.dart';
import 'category_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  TextEditingController searchController = TextEditingController();

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>()
        ..getBanners()
        ..getProduct()
        ..getCategory()
        ..getUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/splash_screen_background.png'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      height: 36.h,
                      width: 36.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Style.primaryPink),
                      child:
                          context.watch<HomeController>().user?.avatar != null
                              ? ClipOval(
                                  child: Image(
                                  image: NetworkImage(context
                                          .watch<HomeController>()
                                          .user!
                                          .avatar ??
                                      ""),
                                  fit: BoxFit.cover,
                                ))
                              : Icon(Icons.person)),
                  24.horizontalSpace,
                  Container(
                    width: 200,
                    child: Text(
                      "Hello, ${context.watch<HomeController>().user?.name}!",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff09101D)),
                    ),
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
                  8.horizontalSpace,
                  GestureDetector(
                    child: Container(
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
                        Icons.logout,
                        color: Color(0xffF43F5E),
                      )),
                    ),
                    onTap: () {
                      LocalStore.storeClear();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => Splash()),
                          (route) => false);
                      setState(() {});
                    },
                  ),
                ],
              ),
              34.verticalSpace,
              Row(
                children: [
                  Expanded(
                      child: CustomTextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    suffixIcon: Icon(Icons.search),
                    hintText: "Search",
                  )),
                  20.horizontalSpace,
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: context
                                .watch<HomeController>()
                                .listOfBanners
                                .length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 16, top: 32),
                                width: MediaQuery.of(context).size.width - 48,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 14),
                                decoration: BoxDecoration(
                                    gradient: Style.primaryPinkGradient,
                                    borderRadius: BorderRadius.circular(24)),
                                child: Row(
                                  children: [
                                    context
                                                .watch<HomeController>()
                                                .listOfBanners[index]
                                                .product
                                                .image !=
                                            null
                                        ? Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(24)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              child: Image.network(
                                                context
                                                        .watch<HomeController>()
                                                        .listOfBanners[index]
                                                        .product
                                                        .image ??
                                                    "",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                    18.horizontalSpace,
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 150,
                                          child: Text(
                                            context
                                                .watch<HomeController>()
                                                .listOfBanners[index]
                                                .title,
                                            style: Style.textStyleRegular(
                                                size: 23,
                                                textColor: Style.whiteColor),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                        Container(
                                          width: 150,
                                          child: Text(
                                            context
                                                    .watch<HomeController>()
                                                    .listOfBanners[index]
                                                    .product
                                                    .name ??
                                                "",
                                            style: Style.textStyleRegular(
                                                size: 18,
                                                textColor: Style.whiteColor),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
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
                            "Popular Categories",
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          GestureDetector(
                            child: Text(
                              "See all",
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffF43F5E)),
                            ),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> CategoryPage()));
                            },
                          ),
                        ],
                      ),
                      32.verticalSpace,
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: context
                                .watch<HomeController>()
                                .listOfCategory
                                .length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 16),
                                width:
                                (MediaQuery.of(context).size.width - 48) / 3,
                                decoration: BoxDecoration(
                                    color: Style.whiteColor,
                                    border: Border.all(color: Style.primaryPink),
                                    borderRadius: BorderRadius.circular(24)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    context
                                        .watch<HomeController>()
                                        .listOfCategory[index]
                                        .image !=
                                        null
                                        ? Image.network(
                                      context
                                          .watch<HomeController>()
                                          .listOfCategory[index]
                                          .image ??
                                          "",
                                      height: 64,
                                    )
                                        : const SizedBox.shrink(),
                                    24.verticalSpace,
                                    Column(
                                      children: [
                                        Text(context
                                            .watch<HomeController>()
                                            .listOfCategory[index]
                                            .name ??
                                            "", style: Style.textStyleRegular(size: 18),),
                                      ],
                                    ),
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
                            "Popular Menu",
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          GestureDetector(
                            child: Text(
                              "See all",
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffF43F5E)),
                            ),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ProductListPage()));
                            },
                          ),
                        ],
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                          context.watch<HomeController>().listOfProduct.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 12),
                              padding: EdgeInsets.only(left: 12, right: 32, top: 12, bottom: 12),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Style.whiteColor,
                                border: Border.all(color: Style.primaryPink),
                                borderRadius: BorderRadius.circular(16)
                              ),
                              child: Row(
                                children: [
                                  context
                                      .watch<HomeController>()
                                      .listOfProduct[index]
                                      .image ==
                                      null
                                      ? const SizedBox.shrink()
                                      : Image.network(
                                    context
                                        .watch<HomeController>()
                                        .listOfProduct[index]
                                        .image ??
                                        "",
                                    height: 64,
                                    width: 64,
                                  ),
                                  20.horizontalSpace,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(context
                                            .watch<HomeController>()
                                            .listOfProduct[index]
                                            .name ??
                                            "", style: Style.textStyleRegular(size: 18),),
                                        Text(context
                                            .watch<HomeController>()
                                            .listOfProduct[index]
                                            .desc ??
                                            "", style: Style.textStyleThin(size: 14, textColor: Style.darkTextGrey),overflow: TextOverflow.ellipsis, maxLines: 3,),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "\$${
                                      context
                                          .watch<HomeController>()
                                          .listOfProduct[index]
                                          .price
                                          .toString()
                                    }", style: Style.textStyleRegular(size: 20, textColor: Style.primaryPink),)
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
