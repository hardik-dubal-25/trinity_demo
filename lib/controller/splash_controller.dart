import '../../imports.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  GetStorageRepository getStorageRepository;
  SplashController(this.getStorageRepository);

  late AnimationController _controller;
  late Animation<Offset> offsetAnimation;

  @override
  void onInit() {
    super.onInit();
    _controller = AnimationController(duration: const Duration(seconds: 0), vsync: this);
    offsetAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 0.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.decelerate));
  }

  @override
  void onReady() {
    super.onReady();
    _launchPage();
  }

  // method to deside app will perform which role either user, attendance manager, branch manager or company it self
  
  _launchPage() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    bool whereLogin = getStorageRepository.hasData(isLoginSession);
    // var roleID = getStorageRepository.read(roleId);
    
    if(whereLogin){
      Get.offAllNamed(AppRoute.routeDashboard);
    }else{
      Get.offAllNamed(AppRoute.routeLogin);
    }
    
    }
}
