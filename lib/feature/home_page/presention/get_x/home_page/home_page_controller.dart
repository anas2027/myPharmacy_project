// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:pharmcy_app/error/failure.dart';

import 'package:pharmcy_app/feature/home_page/domain/entity/warehouse.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/create_order.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/getWarehouseMedcinebyCategor_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/get_warehouses_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/getwarehouse_bycity_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageController extends GetxController {
  GetWarehouseUseCase getWarehouseUseCase;
  CreateOrderUseCase createOrderUseCase;
  GetWarehouseMedcinebyCategorUseCase getWarehouseMedcinebyCategorUseCase;
  GetWarehouseByCity getWarehouseByCategory;

  HomePageController(
      {required this.getWarehouseUseCase,
      required this.createOrderUseCase,
      required this.getWarehouseMedcinebyCategorUseCase,
      required this.getWarehouseByCategory});
  var currentIndex = 1.obs;
  void changePage(int index) async {
    currentIndex.value = index;
    if (index == 0) {
      Get.offAllNamed('/MyMedcinePage');
    } else if (index == 1) {
    } else if (index == 3) {
      Uri phoneno = Uri.parse('tel:+96398345348734');
      if (await launchUrl(phoneno)) {
        //dialer opened
      } else {
        //dailer is not opened
      }
    } else {
      Get.offAllNamed('/MyProduct');
    }
  }

  @override
  onInit() {
    super.onInit();
    getWarehouse();
  }

  List<Warehouse> warehouses = [];
  bool isloading = true;
  Future getWarehouse() async {
    var respone = await getWarehouseUseCase();
    respone.fold((l) => Failure, (r) => warehouses.addAll(r));
    isloading = false;
    update();
  }

  Future RefrechWarehouse() async {
    List<Warehouse> newList = [];
    warehouses = newList;
    var respone = await getWarehouseUseCase();
    respone.fold((l) => Failure, (r) => warehouses.addAll(r));
    isloading = false;
    update();
  }

  String image =
      'https://akm-img-a-in.tosshub.com/businesstoday/images/story/202210/64e01bf1f7dbd9099e249e9c3247fdbb9a46b4b1-1280x720-sixteen_nine.jpg';

  String Searchcitywarehouse = '';

  Future<String> getphName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var namephr = sharedPreferences.get('phname');
    String nameph = '$namephr';
    return nameph;
  }

  int orderId = 1;

  Future createOrder({required String idwarehouse}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var PhId = sharedPreferences.getString('phId');

    final responsecreateOrder =
        await createOrderUseCase(idph: '$PhId', idwarehouse: idwarehouse);
    responsecreateOrder.fold((l) => Failure, (r) => orderId = r);
  }

  int currentindex = 0;
  void changecurrentindex({required int index}) {
    currentindex = index;
    update();
  }

  List cities = [
    'Damascus',
    'Latakia',
    'Ṭartus',
    'Homs',
    'Ḥamāh',
    'Idlib',
    'Maʿlula',
    'Palmyra',
    'Al-Ḥasakah',
    'Darʿā',
    'Aleppo',
    'Al-Ḥasakah',
    'Al-Qāmishlī',
    'Al-Qunayṭirah',
    'Al-Raqqah',
    'Al-Suwayda'
  ];
  Future getWarehouseByCity({required String city}) async {
    List<Warehouse> nre = [];
    warehouses = nre;
    var respone = await getWarehouseByCategory(city: city);
    respone.fold((l) => Failure, (r) => warehouses.addAll(r));
    update();
  }
}
