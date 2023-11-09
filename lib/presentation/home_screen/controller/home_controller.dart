import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<int> currentTabIndex = 0.obs;
  Rx<bool> canShowMore = false.obs;
  Rx<bool> isMenuHidden = false.obs;
  Rx<bool> isExpanded = false.obs;
  Rx<bool> isMenuOpen = false.obs;

  // Rx<bool> canShowMore = false.obs;
  Rx<PageController> pageController = PageController(initialPage: 0).obs;
  checkTab(tab) {
    return currentTabIndex == tab;
  }

  setIsMenuOpen(bool val) {
    isMenuOpen.value = val;
    update();
  }

  setIsExpanded(bool val) {
    isExpanded.value = val;
    update();
  }

  toggleMenuHidden() {
    return isMenuHidden.value = !isMenuHidden.value;
  }

  toggleCanShow() {
    return canShowMore.value = !canShowMore.value;
  }
}
