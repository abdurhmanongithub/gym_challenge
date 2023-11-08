import 'package:get/get.dart';
import 'package:gym/presentation/splash_screen/models/splash_model.dart';
import 'package:gym/routes/app.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onReady() async {
    super.onReady();

    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.toNamed(App.homeScreen);
    });
  }
}
