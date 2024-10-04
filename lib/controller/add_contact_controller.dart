import 'package:trinity_demo/imports.dart';

class AddContactController extends GetxController {
  
  GetStorageRepository storageRepository;
  AddContactController( this.storageRepository);

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
    profileController = TextEditingController();
  }

  addNewContactApiCall() {}
}
