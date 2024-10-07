import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../imports.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.onReady();
    return Scaffold(
        // backgroundColor: Colors.red.shade50,
        body: SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: colorAppPrimary,
            alignment: Alignment.center,
            child: Container(
              height: 250,
              width: 250,
              alignment: Alignment.center,
              child: TextAnimator(
                'Welcome...',
                style: TextStyle(color: colorAppWhite,fontSize: 36,fontStyle: FontStyle.italic),
                incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(
                    delay: const Duration(seconds: 4),curve: Curves.easeIn),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
