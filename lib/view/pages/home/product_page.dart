import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode_app/controller/home_controller.dart';
import 'package:foode_app/controller/user_controller.dart';
import 'package:foode_app/view/pages/auth/splash_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../components/custom_textformfield.dart';
import '../../style/style.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final TextEditingController search = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>()
        ..getProduct(isLimit: false)
        ..getCategory(isLimit: false)
        ..getUser();
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
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                24.horizontalSpace,
                Text("Popular Menu",
                    style: GoogleFonts.sourceSansPro(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff09101D))),
              ],
            ),
            36.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: search,
                    hintText: "Search",
                    suffixIcon: Icon(Icons.search, color: Style.textGreyColor),
                    onChange: (s) {
                      event.searchCategory(s);
                    },
                    keyboardType: TextInputType.text,
                  ),
                ),
                20.horizontalSpace,
                GestureDetector(
                  child: Container(
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
                  onTap: () {
                    event.setFilterChange();
                  },
                ),
              ],
            ),
            state.setFilter || (state.selectIndex == -1)
                ? const SizedBox.shrink()
                : Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Style.primaryPink,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      child: Text(
                          state.listOfCategory[state.selectIndex].name ?? "", style:Style.textStyleRegular(textColor: Style.whiteColor)),
                    ),
                ),
            Expanded(
              child: state.setFilter
                  ? Wrap(
                      children: [
                        for (int i = 0; i < state.listOfCategory.length; i++)
                          InkWell(
                            onTap: () {
                              event.changeIndex(i);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: state.selectIndex == i
                                    ? Colors.pinkAccent
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(color: Colors.pinkAccent),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 6),
                              child: Text(
                                state.listOfCategory[i].name ?? "",
                                style: Style.textStyleRegular(
                                  textColor: state.selectIndex == i
                                      ? Style.whiteColor
                                      : Style.primaryPink,
                                ),
                              ),
                            ),
                          )
                      ],
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          context.watch<HomeController>().listOfProduct.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(16),
                          padding: EdgeInsets.only(top:12, left: 12, bottom: 12, right: 32),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Style.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 50,
                                  offset: Offset(0, 6),
                                  color: Color(0xff5A6CEA).withOpacity(0.08),
                              )
                            ],
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Row(
                            children: [
                              state.listOfProduct[index].image == null
                                  ? const SizedBox.shrink()
                                  : ClipRRect(
                                    child: Image.network(
                                        state.listOfProduct[index].image ?? "",
                                        height: 64,
                                        width: 64,
                                      ),
                                borderRadius: BorderRadius.circular(12),
                                  ),
                              20.horizontalSpace,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(state.listOfProduct[index].name ?? "", style: Style.textStyleRegular(size: 18)),
                                    Text(state.listOfProduct[index].desc ?? "", style: Style.textStyleThin(size: 14, textColor: Style.darkTextGrey),overflow: TextOverflow.ellipsis, maxLines: 2),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Text("\$${
                                     state.listOfProduct[index]
                                          .price
                                          .toString()
                                  }", style: Style.textStyleRegular(size: 20, textColor: Style.primaryPink)),
                                  IconButton(
                                      onPressed: () {
                                        event.changeLike(index);
                                      },
                                      icon: (state.listOfProduct[index].isLike)
                                          ? Icon(Icons.favorite, color: Style.primaryPink,)
                                          : Icon(Icons.favorite_border, color: Style.primaryPink))
                                ],
                              )
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
