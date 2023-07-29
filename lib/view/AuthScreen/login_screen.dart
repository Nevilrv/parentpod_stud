/*
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parentpod/Common/color_helper.dart';
import 'package:parentpod/Common/common_images.dart';
import 'package:parentpod/Common/common_textstyle.dart';
import 'package:parentpod/Common/common_widgets.dart';
import 'package:parentpod/Common/get_storage.dart';
import 'package:parentpod/Model/Apis/api_response.dart';
import 'package:parentpod/Model/ResponseModel/login_response_model.dart';
import 'package:parentpod/View/bottom_bar_screen.dart';
import 'package:parentpod/ViewModel/auth_screen_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = true;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthViewModel authViewModel = Get.put(AuthViewModel());

  @override
  void initState() {
    super.initState();
    String email = SharedPreference.getEmail() ?? '';
    String password = SharedPreference.getPassword() ?? "";

    if (email.isNotEmpty && password.isNotEmpty) {
      userNameController.text = email;
      passwordController.text = password;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Center(child: Image.asset(AppImage.loginImage, scale: 3.5)),
                    SizedBox(
                      height: 13.h,
                    ),
                    Center(
                      child: Text(
                        'Welcome Back',
                        style: TextStyleHelper.blueGrey16500,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Center(
                      child: Text(
                        'Enter your username and password',
                        style: TextStyleHelper.blueGrey16500,
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text('Username', style: TextStyleHelper.black16600),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
                      child: CommonWidgets.commonTextFormField(
                        controller: userNameController,
                        hintText: 'Enter Username',
                        padding: EdgeInsets.only(
                          left: 20.w,
                          bottom: 3.5.h,
                        ),
                      ),
                    ),
                    Text('Password', style: TextStyleHelper.black16600),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
                      child: CommonWidgets.commonTextFormField(
                        controller: passwordController,
                        obSecure: isVisible,
                        hintText: 'Enter Password',
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 15.h),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: Icon(
                            isVisible
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_slash,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyleHelper.blueGrey16500,
                        ),
                        GetBuilder<AuthViewModel>(
                          builder: (controller) {
                            return GestureDetector(
                              onTap: () async {
                                if (userNameController.text.isEmpty &&
                                    passwordController.text.isEmpty) {
                                  CommonWidgets.commonSnackBar(
                                      msg:
                                          'Please enter username and password');
                                  return;
                                } else if (userNameController.text.isEmpty) {
                                  CommonWidgets.commonSnackBar(
                                      msg: 'Please enter username');
                                  return;
                                } else if (passwordController.text.isEmpty) {
                                  CommonWidgets.commonSnackBar(
                                      msg: 'Please enter password');
                                  return;
                                } else {
                                  await controller.login(
                                    body: {
                                      "username":
                                          userNameController.text.toString(),
                                      "password":
                                          passwordController.text.toString(),
                                      "deviceToken":
                                          SharedPreference.getDeviceID()
                                              .toString()
                                    },
                                  );
                                  LoginResponseModel loginResponse =
                                      controller.loginApiResponse.data;

                                  if (loginResponse.status == 1) {
                                    SharedPreference.setEmail(
                                        userNameController.text);
                                    SharedPreference.setPassword(
                                        passwordController.text);

                                    Get.offAll(() => const BottomBarScreen(),
                                            transition: Transition.fadeIn)
                                        ?.then(
                                      (value) {
                                        userNameController.clear();
                                        passwordController.clear();
                                      },
                                    );

                                    CommonWidgets.commonSuccessBar(
                                        msg: loginResponse.message.toString(),
                                        title: 'Login');
                                    SharedPreference.setLogin(true);

                                    SharedPreference.setToken(
                                        loginResponse.token.toString());
                                    SharedPreference.setId(
                                        loginResponse.id.toString());

                                    Map<String, dynamic> role = jsonDecode(
                                        jsonEncode(
                                            loginResponse.record!.roles!));

                                    SharedPreference.setRoleKey(
                                        role.keys.first);

                                    String userName = loginResponse
                                        .record!.username
                                        .toString();

                                    SharedPreference.setUsername(
                                        userName.replaceFirst(userName[0],
                                            userName[0].toUpperCase()));

                                    SharedPreference.setImage(
                                        loginResponse.record!.image.toString());
                                  } else {
                                    await CommonWidgets.commonSnackBar(
                                        msg: loginResponse.message.toString(),
                                        title: 'Login Failed');
                                    userNameController.clear();
                                    passwordController.clear();
                                  }
                                }
                              },
                              child: Container(
                                height: 48.h,
                                width: 140.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: AppColor.kPrimary,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Login',
                                      style: TextStyleHelper.black16600
                                          .copyWith(color: AppColor.whiteColor),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_outlined,
                                      color: AppColor.whiteColor,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
              GetBuilder<AuthViewModel>(
                builder: (controller) {
                  return controller.loginApiResponse.status == Status.LOADING
                      ? Container(
                          width: double.infinity,
                          height: Get.height,
                          color: Colors.black38,
                          child: Center(
                            child: CircularProgressIndicator(
                                color: AppColor.kPrimary),
                          ),
                        )
                      : const SizedBox();
                },
              ),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Text(
                    'Privacy Policy',
                    style: TextStyleHelper.blueGrey16500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

*/

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parentpod_stud/view/HomeScreen/home_screen.dart';
import 'package:parentpod_stud/view/bottom_bar_screen.dart';

import '../../Common/color_helper.dart';
import '../../Common/common_textstyle.dart';
import '../../Common/common_widgets.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = true;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 36.h),
              width: Get.width,
              decoration: BoxDecoration(
                  color: const Color(0xffF8F8F8),
                  borderRadius: BorderRadius.circular(16.r)),
              child: Column(
                children: [
                  Text(
                    'Login',
                    style: TextStyleHelper.pBlacks22w500
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Enter your username and password',
                    style: TextStyleHelper.kLightGrey16w400.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Form(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 36.h),
                      child: Column(
                        children: [
                          CommonWidgets.commonTextfield(
                            controller: userNameController,
                            hintText: 'Email address',
                            prefixIcon: Icon(
                              CupertinoIcons.mail,
                              color: AppColor.pLightGrey,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CommonWidgets.commonTextfield(
                            controller: passwordController,
                            obSecure: isVisible,
                            hintText: 'Password',
                            prefixIcon: Icon(
                              Icons.key,
                              color: AppColor.pLightGrey,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: Icon(
                                isVisible
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash,
                                color: AppColor.pLightGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAll(() => const BottomBarScreen(),
                          transition: Transition.fadeIn);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      margin: EdgeInsets.only(bottom: 36.h),
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          color: AppColor.pPrimary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.exit_to_app, color: Colors.white),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Login',
                            style: TextStyleHelper.pWhite18w700,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ForgotPasswordScreen(),
                          transition: Transition.fadeIn);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColor.pPrimary,
                          fontWeight: FontWeight.w700),
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
