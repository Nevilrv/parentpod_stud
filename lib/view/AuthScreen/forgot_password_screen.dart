import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Common/color_helper.dart';
import '../../Common/common_textstyle.dart';
import '../../Common/common_widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController userNameController = TextEditingController();
  int select = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(gradient: AppColor.bgGradiant),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
              width: Get.width,
              height: 415.h,
              decoration: BoxDecoration(
                  color: const Color(0xffF8F8F8),
                  borderRadius: BorderRadius.circular(16.r)),
              child: Column(
                children: [
                  Text(
                    'Forgot Password',
                    style: TextStyleHelper.pBlacks22w500
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Enter your email address and we \n will help you recover your password.',
                    style: TextStyleHelper.kLightGrey16w400.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Form(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: CommonWidgets.commonTextfield(
                        controller: userNameController,
                        hintText: 'Email address',
                        prefixIcon: Icon(
                          CupertinoIcons.mail,
                          color: AppColor.pLightGrey,
                        ),
                      ),
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     'I am',
                  //     style: TextStyleHelper.pBlack13w700
                  //         .copyWith(fontSize: 16.sp),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10.h,
                  // ),
                  // Row(
                  //   children: List.generate(
                  //     2,
                  //     (index) => Expanded(
                  //       child: GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             select = index;
                  //           });
                  //         },
                  //         child: Container(
                  //           margin: EdgeInsets.only(right: 16.w),
                  //           padding: EdgeInsets.symmetric(vertical: 20.h),
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(6.r),
                  //               border: Border.all(
                  //                 color: select == index
                  //                     ? const Color(0XFF33CF28)
                  //                     : const Color(0xffD9D9D9),
                  //               ),
                  //               color: select == index
                  //                   ? const Color(0xff9c92cf94)
                  //                   : Colors.transparent),
                  //           child: Center(
                  //             child: Text(index == 0 ? 'Student' : 'Parent',
                  //                 style: TextStyle(fontSize: 16.sp)),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    margin: EdgeInsets.only(top: 26.h),
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        color: AppColor.pPrimary),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Submit',
                          style: TextStyleHelper.pWhite18w700,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
