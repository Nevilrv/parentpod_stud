import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parentpod_stud/Controller/homework_controller.dart';
import 'package:parentpod_stud/view/AuthScreen/splash_screen.dart';

import 'Controller/bottom_bar_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(430, 932),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Nunito'),
          initialBinding: BaseBindings(),
          home: const SplashScreen(),
        );
      },
    );
  }
}

class BaseBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomBarController(), fenix: true);
    Get.lazyPut(() => HomeWorkController(), fenix: true);
  }
}
