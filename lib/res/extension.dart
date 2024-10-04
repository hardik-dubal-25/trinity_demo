 
import '../imports.dart';

enum StateStatus { INITIAL, LOADING, SUCCESS, FAILURE, NODATAFOUND }

extension VoidExtensions on void {
  showProgress() {
    Get.dialog(Container(alignment: FractionalOffset.center, child: const CircularProgressIndicator(strokeWidth: 1)));
  }

  void hideProgressBar() {
    Get.back();
  }

  showErrorSnackbar(String? message) {
    // Get.snackbar("There was a problem", message!,
    //     colorText: Colors.white, backgroundColor: Colors.red);
    Get.showSnackbar(
      GetSnackBar(
        messageText: text(message!, colorAppWhite, 17, fwt500),
        margin: const EdgeInsets.all(5),
        //icon: const Icon(Icons.refresh),
        backgroundColor: colorAppRed,
        snackPosition: SnackPosition.TOP,
        maxWidth: GetPlatform.isAndroid ? Get.width :400,
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  showSuccessSnackbar(String? message) {
    // Get.snackbar("Success", message!,
    //     maxWidth: GetPlatform.isAndroid ? Get.width : Get.width * 0.30,
    //     padding: EdgeInsets.zero,
    //     colorText: Colors.black,
    //     backgroundColor: Colors.greenAccent);
    Get.showSnackbar(
      GetSnackBar(
        messageText: text(message!, colorAppWhite, 17, fwt500),
        margin: const EdgeInsets.all(5),
        //icon: const Icon(Icons.refresh),
        backgroundColor: colorAppGreenAccent,
        snackPosition: SnackPosition.TOP,
        maxWidth: GetPlatform.isAndroid ? Get.width : 400,
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  showSnackbar(String? message) {
    //Get.snackbar(title!, message!, colorText: Colors.black, backgroundColor: Colors.white);
    Get.showSnackbar(
      GetSnackBar(
        margin: const EdgeInsets.all(5),
        messageText: text(message!, colorAppWhite, 17, fwt500),
        backgroundColor: Themes.myTheme.primaryColor,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        snackPosition: SnackPosition.TOP,
        maxWidth: GetPlatform.isAndroid ? Get.width : 400,
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }
}
