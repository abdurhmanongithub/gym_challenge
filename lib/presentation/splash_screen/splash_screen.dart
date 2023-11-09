import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym/presentation/splash_screen/controller/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: Container(
          height: Get.size.height,
          width: Get.size.width,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: Get.size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(
                        1.41,
                        0.73,
                      ),
                      end: Alignment(
                        0.87,
                        -0.08,
                      ),
                      colors: [
                        Color.fromRGBO(41, 40, 40, 1),
                        Color.fromRGBO(44, 44, 44, 1)
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      Text(
                        "lbl_home".tr,
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
