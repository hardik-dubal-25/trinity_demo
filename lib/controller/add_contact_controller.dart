import 'dart:convert';

import 'package:trinity_demo/imports.dart';

import 'package:dio/dio.dart' as dio;

class AddContactController extends GetxController {
  GetStorageRepository storageRepository;
  AddContactController(this.storageRepository);

  final _stateStatusRx = Rx<StateStatus>(StateStatus.INITIAL);
  StateStatus get stateStatus => _stateStatusRx.value;

  var formKey = GlobalKey<FormState>();

  late TextEditingController firstNameController,
      lastNameController,
      cityController,
      stateController,
      pincodeController,
      mobileController,
      emailController,
      profileController,
      add1Controller,
      add2Controller,
      landmarkController,
      countryController;

  String? isEmailValid(String? value) => value!.trim().validateEmail();
  String? isMobileValid(String? value) => value!.trim().validateMobile();
  String? isFieldEmpty(String? value) => value!.validateEmpty();

  @override
  void onInit() {
    super.onInit();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    cityController = TextEditingController();
    mobileController = TextEditingController();
    stateController = TextEditingController();
    pincodeController = TextEditingController();
    stateController = TextEditingController();
    emailController = TextEditingController();
    countryController = TextEditingController();
    add1Controller = TextEditingController();
    add2Controller = TextEditingController();
    landmarkController = TextEditingController();
    profileController = TextEditingController();
  }

  addNewContactApiCall() async {
    _stateStatusRx.value = StateStatus.LOADING;
    
    var data = json.encode({
      "first_name": firstNameController.text.trim(),
      "last_name": lastNameController.text.trim(),
      "email": emailController.text.trim(),
      "mobile": mobileController.text.trim(),
      //"profile": profileController.text.trim(),
      "contact_types": [
        {"id": "a1dd708a-3db5-11ef-9634-484520bf7692"}
      ],
      "addresses": [
        {
          "address_line_1": add1Controller.text.trim(),
          "address_line_2": add2Controller.text.trim(),
          "landmark": landmarkController.text.trim(),
          "country_id": "101",
          "state_id": "4030",
          "city": cityController.text.trim(),
          "pincode": pincodeController.text.trim(),
          "is_default": 1
        }
      ]
    });
    print("object data : $data");
    var d = dio.Dio();
    try {
      dio.Response response = await d.request(contactListApi,
          options: dio.Options(
            method: 'POST',
            headers: {
              'Authorization': 'Bearer ${storageRepository.read(token)}'
            },
          ),
          data: data);
      print(response.toString());
      _stateStatusRx.value = StateStatus.SUCCESS;
      if (response.statusCode == 200) {
        _stateStatusRx.value = StateStatus.SUCCESS;
        Get.showSuccessSnackbar("New contact added successfully");
        Get.offAllNamed(AppRoute.routeDashboard);
      } else {
        print("Error : ${response.data}");
      }
    } on dio.DioException catch (e) {
      _stateStatusRx.value = StateStatus.SUCCESS;
      print("object error : ${e.response!.data}");
      Get.defaultDialog(
        title: "Failed!",
        middleText: "${e.response!.data['message']}",
        textConfirm: "Ok",
        onConfirm: () => Get.back(),
      );
    }
  }
}
