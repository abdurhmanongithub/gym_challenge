import 'package:get/get.dart';
import 'package:gym/presentation/reply_screen/controller/reply_controller.dart';

class ReplyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReplyController());
  }
}
