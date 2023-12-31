import 'package:get/get.dart';
import 'package:gym/presentation/home_screen/binding/home_binding.dart';
import 'package:gym/presentation/home_screen/home_screen.dart';
import 'package:gym/presentation/reply_screen/binding/reply_binding.dart';
import 'package:gym/presentation/reply_screen/reply_screen.dart';
import 'package:gym/presentation/splash_screen/binding/splash_binding.dart';
import 'package:gym/presentation/splash_screen/splash_screen.dart';

class App {
  static const String splashScreen = '/splash';
  static const String homeScreen = '/home';
  static const String replyScreen = '/reply';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
      binding: SplashBinding(),
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
      binding: HomeBinding(),
    ),
    GetPage(
      name: replyScreen,
      page: () => ReplyScreen(),
      bindings: [
        ReplyBinding(),
      ],
      binding: ReplyBinding(),
    ),
  ];
}
