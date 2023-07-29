import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parentpod_stud/view/bottom_bar_screen.dart';

import '../../Common/common_images.dart';
import '../../Common/get_storage.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    log('SharedPreference.getLogin()---------->>>>>> ${SharedPreference.getLogin()}');

    Timer(const Duration(seconds: 4), () {
      Get.offAll(
          () => SharedPreference.getLogin() == true
              ? const BottomBarScreen()
              : const LoginScreen(),
          transition: Transition.fadeIn);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppImage.splashImage, scale: 3),
      ),
    );
  }
}
