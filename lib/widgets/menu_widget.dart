import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gym/core/constant.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          Get.size.width * 0.6, // Adjust the width based on your menu content
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        border: Border.all(
          color: const Color(0xFFAEA6A6),
          width: 0.3,
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Example menu items
          MenuItem(icon: SvgPicture.asset(plus), label: 'Post a Seequl'),
          MenuItem(icon: SvgPicture.asset(likes), label: 'View your likes'),
          MenuItem(icon: SvgPicture.asset(posts), label: 'Your Seequl posts'),
          MenuItem(
              icon: SvgPicture.asset(reference),
              label: 'Reference contribution'),
          MenuItem(
              icon: SvgPicture.asset(hashtag), label: 'Hashtag challenges'),
          MenuItem(
              icon: SvgPicture.asset(notification), label: 'Notifications'),
          MenuItem(icon: SvgPicture.asset(about), label: 'About SeeQul'),
          // Add more menu items as needed
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final SvgPicture icon;
  final String label;

  const MenuItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          icon,
          SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}
