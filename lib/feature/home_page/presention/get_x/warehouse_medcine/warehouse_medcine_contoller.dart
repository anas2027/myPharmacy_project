// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/cansle_confirm_order_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/category.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/warehouse.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/warehouse_medcine.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/add_medcine_to_order_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/create_order.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/delete_order.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/get_my_medcine.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/get_warehouses_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/getwarehousebyid_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/usecase/getWarehouseMedcinebyCategor_usecase.dart';
import '../../../domain/usecase/get_category_usecase.dart';

class WarehouseMedcineController extends GetxController {
  GetWarehouseMedcineUseCase getMyMedcineUseCase;
  InternetConnectionChecker connectionState;
  AddMedcineToOrderUseCase addMedcineToOrderUseCase;
  CategoryUseCase categoryUseCase;
  GetWarehouseMedcinebyCategorUseCase getWarehouseMedcinebyCategorUseCase;
  DeleteOrderUseCase deleteOrderUseCase;
  CansleconfirmOrderUseCase cansleconfirmOrderUseCase;
  GetWarehouseUseCase getWarehouseUseCase;
  GetWarehouseByIdUseCase getWarehouseByIdUseCase;
  CreateOrderUseCase createOrderUseCase;
  WarehouseMedcineController(
      {required this.cansleconfirmOrderUseCase,
      required this.deleteOrderUseCase,
      required this.addMedcineToOrderUseCase,
      required this.getMyMedcineUseCase,
      required this.connectionState,
      required this.categoryUseCase,
      required this.getWarehouseMedcinebyCategorUseCase,
      required this.getWarehouseUseCase,
      required this.getWarehouseByIdUseCase,
      required this.createOrderUseCase});
  var getid = Get.parameters;
  @override
  onInit() {
    super.onInit();
    getMedcine();
    getCategory();
    getwarehouse();
    orderId = int.parse('${getid['id']}');
    print(orderId);
  }

  List<WarehouseMedcine> medcine = [];
  bool isloading = true;

  ///                get warehouse Medcine
  Future getMedcine() async {
    List<WarehouseMedcine> newlist = [];
    medcine = newlist;
    var idware = Get.parameters;
    final failureOrPosts =
        await getMyMedcineUseCase(warehouse: int.parse(' ${idware['idware']}'));

    failureOrPosts.fold((l) => Failure, (r) => medcine.addAll(r));
    if (medcine.isEmpty) {
      isloading = false;
    }
    update();
  }

  AddMedcineToOrder(
      {required String quqntity, required String medcineId}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await addMedcineToOrderUseCase(
        medcineId: medcineId, orderid: '', quqntity: quqntity);
  }

  List<MedCategory> category = [];

  getCategory() async {
    List<MedCategory> refrech = [];
    category = refrech;
    var response = await categoryUseCase();
    response.fold((l) => Failure, (r) => category.addAll(r));
    update();
  }

  getmedbycategory(
      {required String nameCate, required String warehouseID}) async {
    List<WarehouseMedcine> newsa = [];
    medcine = newsa;
        var idware = Get.parameters;

    var response = await getWarehouseMedcinebyCategorUseCase(
        categoryName: nameCate, warehouseID: '${idware['idware']}');
    print(nameCate);
    print(warehouseID);
    response.fold((l) => Failure, (r) => medcine.addAll(r));
    if (medcine.isEmpty) {
      isloading = false;
    }
    print(medcine);
    update();
  }

  int currentindex = 0;
  void changecurrentindex({required int index}) {
    currentindex = index;
    update();
  }

  deleteOrder({required String orderId}) async {
    await deleteOrderUseCase(orderId: orderId);
  }

  bool issucssufly = false;

  Future cansleorderConfimration({required String orderId}) async {
    var response = await cansleconfirmOrderUseCase(orderId: orderId);
    var sucssuflyorfiled =
        response.fold((l) => null, (r) => issucssufly = true);
    update();
  }

  List<Warehouse> warehouses = [];
  Future getwarehouse() async {
    var idware = Get.parameters;
    var warehouseid = '${idware['idware']}';
    var response = await getWarehouseByIdUseCase(wareId: warehouseid);
    response.fold((l) => Failure, (r) => warehouses.addAll(r));
    update();
  }

  int orderId = 0;
  createOrder() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var phId = sharedPreferences.getString('phId');
    var resposne = await createOrderUseCase(
        idph: '$phId', idwarehouse: '${warehouses[0].id}');
    resposne.fold((l) => Failure, (r) => orderId = r);
    print(orderId);
    update();
  }
}
