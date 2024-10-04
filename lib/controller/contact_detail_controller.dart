import 'package:dio/dio.dart' as dio;
import '../imports.dart';

class ContactDetailController extends GetxController {
  
  GetStorageRepository storageRepository;

  ContactDetailController( this.storageRepository);

  final _stateStatusRx = Rx<StateStatus>(StateStatus.INITIAL);
  StateStatus get stateStatus => _stateStatusRx.value;
  
  String id = "";
  
  Rx<Contacts> contactDetail = Rx(Contacts());

  @override
  void onInit(){
    super.onInit();
    getContactDetails();
  }

  getContactDetails() async {
      _stateStatusRx.value = StateStatus.LOADING;
    var d = dio.Dio();
    try {
      dio.Response response = await d.request("$contactListApi/${Get.arguments}",
        options: dio.Options(method: 'GET', headers: {
          'Authorization': 'Bearer ${storageRepository.read(token)}'
        }),
      );

      if (response.statusCode == 200) {
        print("object : ${response.data}");
        _stateStatusRx.value = StateStatus.SUCCESS;

        Contacts?  c =  Contacts.fromJson(response.data['data']);
        contactDetail.value = c;
         
      }
    } catch (e) {
      print("object error : $e");
    }
  }
}
