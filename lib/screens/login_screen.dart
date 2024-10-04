import '../../imports.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    setStatusBarColor();
    return SafeArea(
        child: Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Padding(
          padding: appPadding15,
          child: Form(
            key: controller.formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      // verticalSpace(150),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: text("LOG IN", colorAppPrimary, fs24, fwt700)),
                      verticalSpace20,
                      inputField2(
                        hintText: "Username",
                        controller: controller.emailController,
                        // validation: controller.isEmailValid,
                      ),
                      verticalSpace15,
                      Obx(() => inputField2(
                          // prefix: const Padding(
                          //     padding: EdgeInsets.all(12.0), child: Icon(Icons.lock)), //SvgPicture.asset(iconCallSvg)),
                          obscureText: !controller.showPassword.value,
                          controller: controller.passwordController,
                          hintText: "Password",
                          validation: controller.isPasswordValid,
                          suffix: GestureDetector(
                            onTap: () {
                              controller.showPassword.value =
                                  !controller.showPassword.value;
                            },
                            child: Icon(controller.showPassword.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ))),
                      verticalSpace(10),
                      // Container(
                      //   alignment: Alignment.centerRight,
                      //   child: GestureDetector(
                      //       onTap: () {
                      //         Get.toNamed(AppRoute.routeForgotPass);
                      //       },
                      //       child: text(
                      //           "Forgot Password?", colorAppPrimary, 14, fwt500)),
                      // ),
                      verticalSpace(30),
                      normalButton("LOGIN", () {
                        FocusManager.instance.primaryFocus!.unfocus();
                        //Get.toNamed(AppRoute.routeOnboarding);
                        if (controller.formKey.currentState!.validate()) {
                          controller.loginApiCall();
                        }
                      }, bWidth: 180),
                      verticalSpace20,
                      // Container(
                      //   alignment: Alignment.bottomCenter,
                      //   margin: const EdgeInsets.only(bottom: 10),
                      //   child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         text("New here ?", colorTextGreyDark, fs14, fwt500),
                      //         horizontalSpace(3),
                      //         GestureDetector(
                      //             onTap: () {
                      //               Get.toNamed(AppRoute.routeAddAccount);
                      //             },
                      //             child: text("Create Account", colorAppPrimary,
                      //                 fs14, fwt600)),
                      //       ]),
                      // ),
                    
                    ]),
              ),
            ),
          ),
        ),
        Obx(() => Visibility(
            visible: controller.stateStatus.obs == StateStatus.LOADING.obs
                ? true
                : false,
            child: const Loading()))
      ]),
    ));
  }
}
