import 'package:flutter/material.dart';

class AppColor {
  static Color pPrimary = const Color(0xff0077B6);
  static Color pLightPrimary = const Color(0xff91D9FF);
  static Color pGrey = const Color(0xff656565);
  static Color pLightGrey = const Color(0xffA9A9A9);
  static Color pWhiteGrey = const Color(0xffECECEC);
  static Color pBlack = Colors.black;
  static Color pWhite = Colors.white;

  static LinearGradient bgGradiant = const LinearGradient(
    colors: [Color(0xff0077b0), Color(0xff0ec3d8)],
    stops: [0, 1],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
