import '../../imports.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  GetStorageRepository getStorageRepository;
  SplashController(this.getStorageRepository);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _launchPage();
  }

  _launchPage() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    bool whereLogin = getStorageRepository.hasData(isLoginSession);

    if (whereLogin) {
      Get.offAllNamed(AppRoute.routeDashboard);
    } else {
      Get.offAllNamed(AppRoute.routeLogin);
    }
  }
}
