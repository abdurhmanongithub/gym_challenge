import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<int> currentTabIndex = 0.obs;
  Rx<PageController> pageController = PageController(initialPage: 0).obs;
  checkTab(tab) {
    return currentTabIndex == tab;
  }
}
