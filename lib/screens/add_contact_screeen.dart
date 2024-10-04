import 'package:trinity_demo/imports.dart';

class AddContactScreen extends GetView<AddContactController> {
  const AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text("Add new contact", colorAppWhite, 18, fwt500),
      ),
      body: SafeArea(
          child: Stack(children: [
        Padding(
          padding: appPadding15,
          child: SingleChildScrollView(
              child: Form(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              text("FIrst Name", colorAppBlack, 14, fwt400),
              inputField2(
                hintText: "Firstname",
                controller: controller.firstNameController,
                validation: controller.isFieldEmpty,
              ),
              verticalSpace10,
              text("Last Name", colorAppBlack, 14, fwt400),
              inputField2(
                hintText: "Lastname",
                controller: controller.lastNameController,
                validation: controller.isFieldEmpty,
              ),
              verticalSpace10,
              text("Email", colorAppBlack, 14, fwt400),
              inputField2(
                hintText: "ex. abc@gmail.com",
                controller: controller.emailController,
                validation: controller.isEmailValid,
              ),
              verticalSpace10,
              text("Mobile", colorAppBlack, 14, fwt400),
               inputField2(
                hintText: "ex. 9874563210",
                controller: controller.mobileController,
                validation: controller.isMobileValid,
              ),
              verticalSpace10,
              text("Profile", colorAppBlack, 14, fwt400),
              inputField2(
                hintText: "Enter something about yourself",
                controller: controller.profileController,
                validation: controller.isFieldEmpty,
              ),
              verticalSpace10,
              text("Address line 1", colorAppBlack, 14, fwt400),
              inputField2(
                hintText: "",
                controller: controller.add1Controller,
                validation: controller.isFieldEmpty,
              ),

              verticalSpace10,
              text("Address line 2", colorAppBlack, 14, fwt400),
              inputField2(
                hintText: "",
                controller: controller.add2Controller,
                validation: controller.isFieldEmpty,
              ),
              verticalSpace10,
              text("City", colorAppBlack, 14, fwt400),
              inputField2(
                hintText: "",
                controller: controller.cityController,
                validation: controller.isFieldEmpty,
              ),
              verticalSpace10,
              text("Pincode", colorAppBlack, 14, fwt400),
              inputField2(
                hintText: "ex. 380002",
                controller: controller.pincodeController,
                validation: controller.isFieldEmpty,
              ),
              verticalSpace10,
              text("State", colorAppBlack, 14, fwt400),
              inputField2(
                hintText: "",
                controller: controller.stateController,
                validation: controller.isFieldEmpty,
              ),
              verticalSpace10,
              text("Country", colorAppBlack, 14, fwt400),
              inputField2(
                hintText: "",
                controller: controller.countryController,
                validation: controller.isFieldEmpty,
              ),
              verticalSpace(30),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(onPressed: (){
                  FocusManager.instance.primaryFocus!.unfocus();
                        if (controller.formKey.currentState!.validate()) {
                          controller.addNewContactApiCall;
                        }
                }, child: text("Add Contact", colorAppWhite, 16,fwt500)))
            ]),
          )),
        ),
         Obx(() => Visibility(
            visible: controller.stateStatus.obs == StateStatus.LOADING.obs
                ? true
                : false,
            child: const Loading()))

      ])),
    );
  }
}
