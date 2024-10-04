import 'package:trinity_demo/imports.dart';

class ContactDetailScreen extends GetView<ContactDetailController> {
  const ContactDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: appPadding15,
              child: Obx(
                () => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.arrow_back_ios),
                      ),
                      verticalSpace20,
                      text(
                          "First Name : ${controller.contactDetail.value.firstName ?? ""}",
                          colorAppBlack,
                          16,
                          fwt400),
                      text(
                          "Last Name : ${controller.contactDetail.value.lastName ?? ""}",
                          colorAppBlack,
                          16,
                          fwt400),
                      text(
                          "Mobile : ${controller.contactDetail.value.mobile ?? ""}",
                          colorAppBlack,
                          16,
                          fwt400),
                      text(
                          "Email : ${controller.contactDetail.value.email ?? ""}",
                          colorAppBlack,
                          16,
                          fwt400),
                       controller.contactDetail.value.addresses != null && controller.contactDetail.value.addresses!.isNotEmpty 
                          ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text(
                                    "Address line 1 : ${controller.contactDetail.value.addresses!.first.addressLine1 ?? ""}",
                                    colorAppBlack,
                                    16,
                                    fwt400),
                                text(
                                    "Address line 2 : ${controller.contactDetail.value.addresses!.first.addressLine2 ?? ""}",
                                    colorAppBlack,
                                    16,
                                    fwt400),
                                text(
                                    "City : ${controller.contactDetail.value.addresses!.first.city ?? ""}",
                                    colorAppBlack,
                                    16,
                                    fwt400),
                                text(
                                    "Pincode : ${controller.contactDetail.value.addresses!.first.pincode ?? ""}",
                                    colorAppBlack,
                                    16,
                                    fwt400),
                                text(
                                    "State : ${controller.contactDetail.value.addresses!.first.stateName ?? ""}",
                                    colorAppBlack,
                                    16,
                                    fwt400),
                                text(
                                    "Country : ${controller.contactDetail.value.addresses!.first.countryName ?? ""}",
                                    colorAppBlack,
                                    16,
                                    fwt400),
                              ],
                            )
                          : SizedBox()
                    ]),
              ),
            ),
            Obx(() => Visibility(
                visible: controller.stateStatus.obs == StateStatus.LOADING.obs
                    ? true
                    : false,
                child: const Loading()))
          ],
        ),
      ),
    );
  }
}
