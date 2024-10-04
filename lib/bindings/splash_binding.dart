 
import '../imports.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(Get.find()));
    Get.lazyPut(() => GlobalController());

  }
}
