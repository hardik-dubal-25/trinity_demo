import '../../imports.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();

  RxBool isLogin = false.obs;
  
  // final userDataRx = Rx<User>(User());
  // User? get userData => userDataRx.value;

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}