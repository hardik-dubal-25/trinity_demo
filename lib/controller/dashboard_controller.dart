import '../../imports.dart';
import 'package:dio/dio.dart' as dio;

class DashboardController extends GetxController {
  
  GetStorageRepository getStorageRepository;
  DashboardController(  this.getStorageRepository);
  
  final _stateStatusRx = Rx<StateStatus>(StateStatus.INITIAL);
  StateStatus get stateStatus => _stateStatusRx.value;
  
  RxBool isHovering = false.obs;
  String user = "0";
  static DashboardController get to => Get.find();

  final _contacts = <Contacts>[].obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;
  RxInt currentPage = RxInt(0),lPage = RxInt(1);

  List<Contacts> get contacts => _contacts.toList();
  int get limit => _paginationFilter.value.limit!;
  int get _page => _paginationFilter.value.page!;
  bool get lastPage => _lastPage.value;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    user = getStorageRepository.read(userIdSession);
    ever(_paginationFilter, (_) => getContactList());
    _changePaginationFilter(1, 2);
     
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  Future<void> getContactList() async {
    _stateStatusRx.value = StateStatus.LOADING;
    var d = dio.Dio();
    try {
      
      dio.Response response = await d.request(contactListApi,
        options: dio.Options(method: 'GET', headers: {
          'Authorization': 'Bearer ${getStorageRepository.read(token)}'
        },
        
        ),
        queryParameters: {'page':currentPage.value + 1,'size':12}
      );

      if (response.statusCode == 200) {
         
        _stateStatusRx.value = StateStatus.SUCCESS;
        currentPage.value = response.data['data']['current_page']; 
        final List<Contacts> d = Contacts.fromArrayOfHashmap(response.data['data']['data']);

        _contacts.addAll(d);
      }
    } catch (e) {
      debugPrint("object error : $e");
    }
  }

  void changeTotalPerPage(int limitValue) {
    _contacts.clear();
    if(limitValue == lPage.value){
      _lastPage.value = true;
    }
    else{
      _lastPage.value = false;
    }
    _changePaginationFilter(currentPage.value, lPage.value);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);
}
