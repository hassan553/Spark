
import 'package:get/get.dart';
import 'package:rakna/features/auth/controller/login_controller.dart';
import 'package:rakna/features/auth/controller/register_controller.dart';
import 'package:rakna/features/home/controller/home_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterController());
  }
}
