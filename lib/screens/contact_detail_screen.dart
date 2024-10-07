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
                        child: Container(
                          height: 30,
                          width: 30,
                          padding: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(border: Border.all(),shape: BoxShape.circle),
                          child: const Icon(Icons.arrow_back_ios,size: 16,)),
                      ),
                      verticalSpace20,
                      Center(
                        child: Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, border: Border.all()),
                          child: const Icon(Icons.person),
                        ),
                      ),
                      verticalSpace5,
                      Center(
                        child: text(
                            "${controller.contactDetail.value.firstName ?? ""} ${controller.contactDetail.value.lastName ?? ""}",
                            colorAppBlack,
                            18,
                            fwt500),
                      ),
                      verticalSpace5,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.call,
                            size: 16,
                          ),
                          horizontalSpace5,
                          text(controller.contactDetail.value.mobile ?? "",
                              colorAppBlack, 16, fwt400),
                        ],
                      ),
                      verticalSpace5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.mail,
                            size: 16,
                          ),
                          horizontalSpace5,
                          text(controller.contactDetail.value.email ?? "",
                              colorAppBlack, 16, fwt400),
                        ],
                      ),
                      controller.contactDetail.value.addresses != null &&
                              controller
                                  .contactDetail.value.addresses!.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                verticalSpace10,
                                divider(),
                                verticalSpace5,
                                text("Address", colorAppBlack, fs18, fwt500),
                                verticalSpace5,
                                Container(
                                  width: Get.width,
                                  alignment: Alignment.centerLeft,
                                  padding: appPadding5,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: colorAppGrey, width: 0.5),
                                      borderRadius: borderRadius10),
                                  child: text(
                                      "${controller.contactDetail.value.addresses!.first.addressLine1 ?? ""}, \n ${controller.contactDetail.value.addresses!.first.addressLine2 ?? ""}",
                                      colorAppBlack,
                                      16,
                                      fwt400),
                                ),
                                verticalSpace10,
                                text("City : ", colorAppBlack, 16, fwt400),
                                verticalSpace5,
                                Container(
                                  width: Get.width,
                                  alignment: Alignment.centerLeft,
                                  padding: appPadding5,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: colorAppGrey, width: 0.5),
                                      borderRadius: borderRadius10),
                                  child: text(
                                      controller.contactDetail.value.addresses!
                                              .first.city ??
                                          "",
                                      colorAppBlack,
                                      16,
                                      fwt400),
                                ),
                                verticalSpace10,
                                text(
                                    "Pincode : ",
                                    colorAppBlack,
                                    16,
                                    fwt400),
                                    verticalSpace5,
                                Container(
                                  width: Get.width,
                                  alignment: Alignment.centerLeft,
                                  padding: appPadding5,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: colorAppGrey, width: 0.5),
                                      borderRadius: borderRadius10),
                                  child: text(
                                      controller.contactDetail.value.addresses!
                                              .first.pincode ??
                                          "",
                                      colorAppBlack,
                                      16,
                                      fwt400),
                                ),
                                verticalSpace10,
                                text(
                                    "State :  ",
                                    colorAppBlack,
                                    16,
                                    fwt400),
                                    verticalSpace5,
                                Container(
                                  width: Get.width,
                                  alignment: Alignment.centerLeft,
                                  padding: appPadding5,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: colorAppGrey, width: 0.5),
                                      borderRadius: borderRadius10),
                                  child: text(
                                      controller.contactDetail.value.addresses!
                                              .first.stateName ??
                                          "",
                                      colorAppBlack,
                                      16,
                                      fwt400),
                                ),
                                verticalSpace10,
                                text(
                                    "Country : ",
                                    colorAppBlack,
                                    16,
                                    fwt400),
                                    verticalSpace5,
                                Container(
                                  width: Get.width,
                                  alignment: Alignment.centerLeft,
                                  padding: appPadding5,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: colorAppGrey, width: 0.5),
                                      borderRadius: borderRadius10),
                                  child: text(
                                      controller.contactDetail.value.addresses!
                                              .first.countryName ??
                                          "",
                                      colorAppBlack,
                                      16,
                                      fwt400),
                                ),
                                verticalSpace10,
                              ],
                            )
                          : const SizedBox()
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
