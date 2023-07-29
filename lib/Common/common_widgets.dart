import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'color_helper.dart';
import 'common_textstyle.dart';

class CommonWidgets {
  static Widget commonTextfield({
    required String hintText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    bool obSecure = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obSecure,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color: AppColor.pLightGrey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color: AppColor.pLightGrey,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color: AppColor.pLightGrey,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color: AppColor.pLightGrey,
            ),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyleHelper.kLightGrey16w400),
    );
  }

  static Widget commonTextFormField({
    required String hintText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    Widget? suffixIcon,
    EdgeInsets? padding,
    bool obSecure = false,
  }) {
    return Container(
      height: 55.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade400, blurRadius: 7),
        ],
      ),
      child: Center(
        child: TextFormField(
          obscureText: obSecure,
          validator: validator,
          controller: controller,
          style: TextStyle(color: AppColor.pGrey, fontSize: 15.sp),
          cursorColor: AppColor.pPrimary,
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: padding,
            hintText: hintText,
            suffixIcon: suffixIcon,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
          ),
        ),
      ),
    );
  }

  static Widget commonContainer({String? label, Widget? suffix}) {
    return Container(
      height: 52.h,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 25.h),
      child: TextField(
        cursorColor: Colors.black,
        autofocus: true,
        readOnly: true,
        decoration: InputDecoration(
          labelStyle: TextStyleHelper.pBlack13w700,
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabled: true,
          suffixIcon: suffix,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: AppColor.pLightGrey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: AppColor.pLightGrey)),
        ),
      ),
    );
  }

  static commonSnackBar({String? msg, String? title = "Oops!"}) {
    return Get.snackbar(
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 1000),
        boxShadows: [
          const BoxShadow(
            color: Colors.black,
            blurRadius: 5,
          )
        ],
        "",
        "",
        titleText: Text("$title",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: Colors.white,
            )),
        messageText: Text("$msg",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              color: Colors.white,
            )),
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(18.h));
  }

  static commonSuccessBar({String? msg, String? title}) {
    return Get.snackbar(
        backgroundColor: Colors.white,
        duration: const Duration(milliseconds: 1000),
        boxShadows: [
          const BoxShadow(
            color: Colors.black,
            blurRadius: 5,
          )
        ],
        "",
        "",
        titleText: Text('$title',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18.sp,
              color: AppColor.pPrimary,
            )),
        messageText: Text("$msg",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              color: AppColor.pPrimary,
            )),
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(18.h));
  }
}
