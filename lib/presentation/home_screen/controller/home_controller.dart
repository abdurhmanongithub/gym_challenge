import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<int> currentTabIndex = 0.obs;
  Rx<bool> canShowMore = false.obs;
  Rx<bool> isMenuHidden = false.obs;
  Rx<int?> maxLines = 4.obs;

  // Rx<bool> canShowMore = false.obs;
  Rx<PageController> pageController = PageController(initialPage: 0).obs;
  checkTab(tab) {
    return currentTabIndex == tab;
  }

  setMaxLine(int val) {
    if (val < 0) {
      maxLines.value = null;
    } else {
      maxLines.value = val;
    }
    update();
  }

  toggleMenuHidden() {
    return isMenuHidden.value = !isMenuHidden.value;
  }

  toggleCanShow() {
    return canShowMore.value = !canShowMore.value;
  }
}
