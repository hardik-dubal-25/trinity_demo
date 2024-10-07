import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:trinity_demo/imports.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text("Hii, ${controller.user}", colorAppWhite, 16, fwt500),
        actions: [
          GestureDetector(
            onTap: () {
              controller.getStorageRepository.erase();
              Get.offAllNamed(AppRoute.routeLogin);
            },
            child: Icon(Icons.logout_outlined, color: colorAppWhite),
          ),
          horizontalSpace10
        ],
      ),
      floatingActionButton: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(shape: const CircleBorder()),
          onPressed: () => Get.toNamed(AppRoute.routeAddContact),
          label: const Icon(Icons.add)),
      body: Stack(
        children: [
          RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: () async {
              controller.getContactList();
            },
            child: Obx(() => LazyLoadScrollView(
                  onEndOfPage: controller.loadNextPage,
                  isLoading: controller.lastPage,
                  child: ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.contacts.length,
                    itemBuilder: (context, index) {
                      final user = controller.contacts[index];
                      return GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoute.routeContactDetails,
                               arguments: user.id);
                        },
                        child: Container(
                          margin: appPaddingT10,
                          padding: appPaddingB10,
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.2,color: colorAppGrey))),
                          child: Row(
                            children: [
                              horizontalSpace5,
                              const Icon(Icons.person_3_outlined),
                              horizontalSpace(10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                text("${user.firstName!} ${user.lastName ?? ""}",colorAppBlack,20,fwt500),
                                 text(user.mobile ?? "",colorAppBlack,16,fwt400),
                              ],)
                            ],
                          ),
                        ),
                      ); 
                      
                      // ListTile(
                      //   dense: true,
                      //   leading: const Icon(Icons.person_3_outlined),
                      //   title:
                      //       Text("${user.firstName!} ${user.lastName ?? ""}"),
                      //   trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      //   shape: Border(
                      //       bottom:
                      //           BorderSide(color: colorAppGrey, width: 0.3)),
                      //   subtitle: Text(user.mobile ?? ""),
                      //   onTap: () {
                      //     Get.toNamed(AppRoute.routeContactDetails,
                      //         arguments: user.id);
                      //   },
                      // );
                    },
                  ),
                )),
          ),
          Obx(() => Visibility(
              visible: controller.stateStatus.obs == StateStatus.LOADING.obs
                  ? true
                  : false,
              child: const Loading()))
        ],
      ),
    );
  }
}
