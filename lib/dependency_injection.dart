


import 'package:connectivity_plus/connectivity_plus.dart';
import '../imports.dart'; 
import 'res/network_info.dart'; 




class DependencyInjection {
  static void init() {
    Get.lazyPut<GetStorage>(() => GetStorage(), fenix: true);
    Get.lazyPut<GetStorageRepository>(() => GetStorageRepository(Get.find()), fenix: true);

    //DIO BINDIN
   
    Get.lazyPut<Connectivity>(Connectivity.new, fenix: true);
    Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(Get.find()), fenix: true);
  }
}

