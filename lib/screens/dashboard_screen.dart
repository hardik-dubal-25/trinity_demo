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
          onPressed: () => Get.toNamed(AppRoute.routeAddContact),
          label: Icon(Icons.add)),
      body: Stack(
        children: [
          RefreshIndicator(
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
                      return ListTile(
                        dense: true,
                        title:
                            Text("${user.firstName!} ${user.lastName ?? ""}"),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                        shape: Border(
                            bottom:
                                BorderSide(color: colorAppGrey, width: 0.3)),
                        subtitle: Text(user.mobile ?? ""),
                        onTap: () {
                          Get.toNamed(AppRoute.routeContactDetails,
                              arguments: user.id);
                        },
                      );
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
