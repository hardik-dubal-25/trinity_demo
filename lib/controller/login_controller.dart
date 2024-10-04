import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import '../../imports.dart';
import '../res/network_info.dart'; 

class LoginController extends GetxController {
   
  GetStorageRepository storageRepository;
  NetworkInfo networkInfo;

  LoginController(  this.storageRepository, this.networkInfo);
  final _stateStatusRx = Rx<StateStatus>(StateStatus.INITIAL);
  StateStatus get stateStatus => _stateStatusRx.value;
  RxBool showPassword = false.obs;

  static LoginController get to => Get.find();
  var formKey = GlobalKey<FormState>();

  late TextEditingController confirmPassController,
      nameController,
      mobileController,
      emailController,
      passwordController;

  String? isEmailValid(String? value) => value!.trim().validateEmail();
  String? isMobileValid(String? value) => value!.trim().validateMobile();
  String? isPasswordValid(String? value) => value!.validatePassword();
  String? isConfirmPasswordValid(String? value) =>
      value!.trim().validateConfirmPassword(value, passwordController.text);
  String? isFieldEmpty(String? value) => value!.validateEmpty();

  @override
  Future<void> onInit() async {
    super.onInit();

    nameController = TextEditingController();
    mobileController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();
  }

  RxString deviceId = "".obs;
  var version = "".obs;
 

  loginApiCall() async {
    var formData = dio.FormData.fromMap({
      "mobile": emailController.text.trim(),
      "password": passwordController.text.trim(),
       
    });

    networkInfo.isConnected().then((value) async {
      if (value) {
        _stateStatusRx.value = StateStatus.LOADING;
        showSnackbar('Logging in ... ');
        var d = dio.Dio();
        try{
          dio.Response response = await d.request(
          "https://crmcomponentapi.blueflower.in/api/login",
          options: dio.Options(
            method: 'POST',

          ),
          data: formData,
           
        );
         
        if (response.statusCode == 200) {
          print(json.encode(response.data));
          _stateStatusRx.value = StateStatus.SUCCESS;
          storageRepository.write(isLoginSession, true);
          storageRepository.write(userIdSession,"${response.data['user']['first_name']} ${response.data['user']['last_name']}");
          storageRepository.write(token, response.data['token']);
          
          Get.offAllNamed(AppRoute.routeDashboard);
        } else {
          print(response.statusMessage);
        }
        }catch(e){
          print("object error : $e");
        }
         
      } else {}
    });
  }

  bool fieldValidation() {
    return formKey.currentState?.validate() == true;
  }
}
