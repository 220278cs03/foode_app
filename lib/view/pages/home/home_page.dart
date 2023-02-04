import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_controller.dart';
import '../../../controller/local_store/local_store.dart';
import '../../style/style.dart';
import '../auth/splash_page.dart';

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
                image:
                    AssetImage('assets/image/splash_screen_background.png'),
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
                        shape: BoxShape.circle,
                      color: Style.primaryPink
                        ),
                    child: context.watch<HomeController>().user?.avatar != null ? ClipOval(child: Image(image: NetworkImage(context.watch<HomeController>().user!.avatar ?? ""), fit: BoxFit.cover,)): Icon(Icons.person)),
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
                    onTap: (){
                      LocalStore.storeClear();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>Splash()), (route) => false);
                      setState(() {});
                    },
                  ),
                ],
              ),
              34.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
