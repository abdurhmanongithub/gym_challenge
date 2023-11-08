import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gym/presentation/feed_screen/feed_screen.dart';
import 'package:gym/presentation/home_screen/bottom_navigation_item.dart';
import 'package:gym/presentation/home_screen/controller/home_controller.dart';
import 'package:tuple/tuple.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: controller.pageController.value,
          onPageChanged: (index) {
            print('sad');
            if (index <= 1) {
              controller.currentTabIndex.value = index;
            } else {
              controller.currentTabIndex.value = index + 1;
            }
          },
          children: const <Widget>[
            FeedPage(),
          ],
        ),
        bottomNavigationBar: Material(
          elevation: 4,
          child: SafeArea(
            bottom: true,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.brown,
                border: Border(
                  top: Divider.createBorderSide(context),
                ),
              ),
              height: 56,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: BottomNavigationItem(
                      SvgPicture.asset(
                        'assets/icons/apps.svg',
                        colorFilter: ColorFilter.mode(
                            controller.checkTab(0)
                                ? const Color.fromRGBO(202, 177, 82, 1)
                                : Colors.white,
                            BlendMode.srcIn),
                      ),
                      controller.checkTab(0),
                      'Apps',
                      onPress: () {},
                    ),
                  ),
                  Expanded(
                    child: BottomNavigationItem(
                      SvgPicture.asset(
                        'assets/icons/qucan.svg',
                        colorFilter: ColorFilter.mode(
                            controller.checkTab(1)
                                ? const Color.fromRGBO(202, 177, 82, 1)
                                : Colors.white,
                            BlendMode.srcIn),
                      ),
                      controller.checkTab(1),
                      'Qucan',
                      onPress: () {},
                    ),
                  ),
                  Expanded(
                    child: BottomNavigationItem(
                      SvgPicture.asset(
                        'assets/icons/zaady.svg',
                        colorFilter: ColorFilter.mode(
                            controller.checkTab(2)
                                ? const Color.fromRGBO(202, 177, 82, 1)
                                : Colors.white,
                            BlendMode.srcIn),
                      ),
                      controller.checkTab(2),
                      'Zaady',
                      onPress: () {},
                    ),
                  ),
                  Expanded(
                    child: BottomNavigationItem(
                      SvgPicture.asset(
                        'assets/icons/organize_icon.svg',
                        colorFilter: ColorFilter.mode(
                            controller.checkTab(3)
                                ? const Color.fromRGBO(202, 177, 82, 1)
                                : Colors.white,
                            BlendMode.srcIn),
                      ),
                      controller.checkTab(3),
                      'Organize',
                      onPress: () {},
                    ),
                  ),
                  Expanded(
                    child: BottomNavigationItem(
                      SvgPicture.asset(
                        'assets/icons/program.svg',
                        colorFilter: ColorFilter.mode(
                            controller.checkTab(4)
                                ? const Color.fromRGBO(202, 177, 82, 1)
                                : Colors.white,
                            BlendMode.srcIn),
                      ),
                      controller.checkTab(4),
                      'Profile',
                      onPress: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white70,
      ),
    );
  }
}
