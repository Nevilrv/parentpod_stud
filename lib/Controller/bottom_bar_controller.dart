import 'package:get/get.dart';

class BottomBarController extends GetxController {
  int selected = 0;
  bool isLoading = false;

  setLoading(bool value) {
    isLoading = value;

    update();
  }

  changeTab(int value) {
    selected = value;
    update();
  }
}
