import '../../imports.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(
          Get.find(),
          Get.find(),
        ));
  }
}
