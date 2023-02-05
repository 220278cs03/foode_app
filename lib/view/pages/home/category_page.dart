import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode_app/view/components/custom_textformfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_controller.dart';
import '../../components/custom_network_imiage.dart';
import '../../style/style.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final TextEditingController search = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>().getCategory(isLimit: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeController>();
    final event = context.read<HomeController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
        child: Column(
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
                Text("Popular Categories",
                    style: GoogleFonts.sourceSansPro(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff09101D))),
              ],
            ),
            38.verticalSpace,
            CustomTextFormField(
              controller: search,
              hintText: "Search",
              suffixIcon: Icon(Icons.search,color: Style.textGreyColor),
              onChange: (s) {
                event.searchCategory(s);
              }, keyboardType: TextInputType.text,
            ),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: state.listOfCategory.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(8),
                     padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 50,
                              offset: Offset(0, 6),
                              color: Color(0xff5A6CEA).withOpacity(0.08))
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          state.listOfCategory[index].image == null
                              ? const SizedBox.shrink()
                              : CustomImageNetwork(
                            image: state.listOfCategory[index].image ?? "",
                            height: 80,
                            width: 80,
                          ),
                          8.verticalSpace,
                          Text(state.listOfCategory[index].name ?? "",
                              style: Style.textStyleRegular(
                                  size: 18)),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}