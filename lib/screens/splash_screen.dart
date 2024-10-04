
import '../imports.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.red.shade50,
        body: SafeArea(
      child: SlideTransition(
        position: controller.offsetAnimation,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: colorAppPrimary,
              alignment: Alignment.center,
              child: Container(
                height: 150,
                width: 150,
                alignment: Alignment.center,
                child: text("Welcome", colorAppWhite,fs24,fwt500),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
