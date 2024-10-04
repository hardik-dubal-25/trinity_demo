
import 'package:trinity_demo/imports.dart';

class AddContactBinding extends Bindings{
  @override
  void dependencies() {
        Get.lazyPut(() => AddContactController(Get.find()));

  }
}