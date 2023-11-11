import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/presentation/feed_screen/feed_screen.dart';
import 'package:gym/presentation/home_screen/bottom_navigation_item.dart';
import 'package:gym/presentation/home_screen/controller/home_controller.dart';
import 'package:gym/widgets/comment_bottom_sheet.dart';
import 'package:gym/widgets/menu_widget.dart';
import 'package:like_button/like_button.dart';
import 'package:tuple/tuple.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => controller.setIsMenuOpen(false),
          child: PageView(
            controller: controller.pageController.value,
            onPageChanged: (index) {
              if (index <= 1) {
                controller.currentTabIndex.value = index;
              } else {
                controller.currentTabIndex.value = index + 1;
              }
            },
            children: <Widget>[
              PageView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                allowImplicitScrolling: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  String caption =
                      'Lorem ipsum dolor sit amet consectetur. Eget aenean integer amet sapien arcu urna turpis amet elementum. A nec euismod in quam venenatis. Consectetur et nunc amet mattis dui imperdiet tempus. Et aliquet gravida posuere pretium donec diam nibh sed. Pharetra non vitae urna aliquet egestas. Phasellus at id adipiscing eget. Lorem volutpat dolor lorem pharetra nunc duis lorem integer. Magna in pellentesque pretium elementum suspendisse tincidunt fermentum praesent.';
                  return Obx(
                    () => Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/bg.jpg'), // Replace with your image path
                          fit: BoxFit
                              .cover, // Adjust the fit as needed (cover, contain, etc.)
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          Visibility(
                            visible: !controller.isMenuHidden.value &&
                                !controller.isMenuOpen.value,
                            child: Positioned(
                              top: 10,
                              child: GestureDetector(
                                onTap: () {
                                  controller.setIsMenuOpen(true);
                                },
                                child: SvgPicture.asset(
                                    'assets/icons/breadcrumb.svg'),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !controller.isMenuHidden.value &&
                                controller.isMenuOpen.value,
                            child: Positioned(
                              top: 0,
                              child: Menu(),
                            ),
                          ),
                          !controller.isMenuHidden.value
                              ? Positioned(
                                  bottom: 10,
                                  child: Container(
                                    width: Get.size.width * 0.85,
                                    margin: const EdgeInsets.only(
                                        left: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                      color:
                                          (const Color.fromRGBO(76, 66, 67, 1))
                                              .withOpacity(0.66),
                                      borderRadius: BorderRadius.circular(
                                          15), // Circular border radius
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          Visibility(
                                            visible:
                                                controller.isExpanded.value,
                                            child: GestureDetector(
                                              onTap: () => controller
                                                  .setIsExpanded(false),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    '... Less',
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          const Color.fromRGBO(
                                                        44,
                                                        202,
                                                        160,
                                                        1,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 1.0),
                                                  SizedBox(
                                                    // height: ,
                                                    child: Transform.rotate(
                                                      angle:
                                                          180 * 3.1415927 / 180,
                                                      child: Image.asset(
                                                        'assets/images/more_btn.png',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            caption,
                                            maxLines: 100,
                                            // maxLines: controller.maxLines.value,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.roboto(
                                              fontSize:
                                                  controller.isExpanded.value
                                                      ? 20
                                                      : 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Row(
                                              children: [
                                                const Text(
                                                  '27 Oct, 2020 @5:23pm',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255,
                                                        229,
                                                        165,
                                                        165), // Loosely pink color
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Visibility(
                                                  visible:
                                                      caption.length > 120 &&
                                                          !controller
                                                              .isExpanded.value,
                                                  child: GestureDetector(
                                                    onTap: () => controller
                                                        .isExpanded(true),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          '... More',
                                                          style: GoogleFonts
                                                              .roboto(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: const Color
                                                                .fromRGBO(44,
                                                                202, 160, 1),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 1.0),
                                                        SizedBox(
                                                          // height: ,
                                                          child: Image.asset(
                                                            'assets/images/more_btn.png',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          !controller.isMenuHidden.value
                              ? SafeArea(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: ConstrainedBox(
                                      constraints: const BoxConstraints.expand(
                                          width: 50, height: 270),
                                      child: Column(
                                        children: <Widget>[
                                          LikeButton(
                                            animationDuration:
                                                const Duration(seconds: 0),
                                            likeCountAnimationType:
                                                LikeCountAnimationType.none,
                                            countPostion: CountPostion.bottom,
                                            likeBuilder: (isLiked) {
                                              return SvgPicture.asset(
                                                'assets/icons/book.svg',
                                                height: 40,
                                              );
                                            },
                                            likeCount:
                                                Random().nextInt(100) + 5023,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          LikeButton(
                                            animationDuration:
                                                const Duration(seconds: 0),
                                            likeCountAnimationType:
                                                LikeCountAnimationType.none,
                                            countPostion: CountPostion.bottom,
                                            onTap: (isLiked) async {
                                              showModalBottomSheet(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return CommentBottomSheet();
                                                },
                                              );
                                              return false;
                                            },
                                            likeBuilder: (isLiked) {
                                              return SvgPicture.asset(
                                                'assets/icons/comment.svg',
                                                height: 40,
                                              );
                                            },
                                            likeCount:
                                                Random().nextInt(100) + 5023,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          LikeButton(
                                            countPostion: CountPostion.bottom,
                                            size: 40,
                                            isLiked: Random().nextInt(100) > 50
                                                ? true
                                                : false,
                                            likeCount:
                                                Random().nextInt(100) + 50,
                                            onTap: (state) async {
                                              return !state;
                                            },
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SvgPicture.asset(
                                              'assets/icons/share.svg'),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          InkWell(
                                            child: SvgPicture.asset(
                                                'assets/icons/more_right.svg'),
                                            onTap: () {
                                              controller.toggleMenuHidden();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          controller.isMenuHidden.value
                              ? SafeArea(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: ConstrainedBox(
                                      constraints: const BoxConstraints.expand(
                                          width: 50, height: 50),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () =>
                                                controller.toggleMenuHidden(),
                                            child: SvgPicture.asset(
                                                'assets/icons/less_left.svg'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => Visibility(
            visible: !controller.isMenuHidden.value,
            child: Material(
              elevation: 4,
              child: SafeArea(
                bottom: true,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(46, 46, 46, 1),
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
          ),
        ),
        backgroundColor: Colors.white70,
      ),
    );
  }
}
