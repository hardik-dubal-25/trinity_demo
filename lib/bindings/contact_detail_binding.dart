import 'package:trinity_demo/imports.dart';

class ContactDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactDetailController(Get.find()));
  }
}
