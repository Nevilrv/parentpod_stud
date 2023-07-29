import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:parentpod_stud/Common/color_helper.dart';
import 'package:parentpod_stud/Common/get_storage.dart';
import 'package:parentpod_stud/Controller/bottom_bar_controller.dart';
import '../Common/list.dart';
import 'AuthScreen/login_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  BottomBarController bottomBarController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: ListCollection().menus[controller.selected]['screen'],
          ),
          floatingActionButton: controller.selected == 0
              ? FloatingActionButton(
                  backgroundColor: AppColor.pWhite,
                  child: controller.isLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColor.pPrimary,
                          ),
                        )
                      : Icon(Icons.exit_to_app, color: AppColor.pPrimary),
                  onPressed: () {
                    try {
                      controller.setLoading(true);
                      SharedPreference.clearAllPref();
                      Get.offAll(
                        () => const LoginScreen(),
                      );
                    } catch (e) {
                      controller.setLoading(false);
                    }
                  },
                )
              : const SizedBox(),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(left: 35.w, right: 35.w),
            height: 60.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                ListCollection().menus.length,
                (index) => GestureDetector(
                  onTap: () {
                    controller.changeTab(index);
                  },
                  child: Container(
                    height: 60.h,
                    padding: EdgeInsets.all(6.w),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          ListCollection().menus[index]['icons'],
                          height: 20.h,
                          width: 20.h,
                          color: controller.selected == index
                              ? AppColor.pPrimary
                              : Colors.grey,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          ListCollection().menus[index]['title'],
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: controller.selected == index
                                ? AppColor.pPrimary
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
