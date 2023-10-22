import 'package:get/get.dart';
import 'package:pharmcy_app/feature/home_page/presention/get_x/warehouse_medcine/warehouse_medcine_contoller.dart';
import 'package:pharmcy_app/injection_container.dart';

class WarehouseMedcineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WarehouseMedcineController(
        getMyMedcineUseCase: sl(),
        connectionState: sl(),
        cansleconfirmOrderUseCase: sl(),
        addMedcineToOrderUseCase: sl(),
        categoryUseCase: sl(),
        getWarehouseMedcinebyCategorUseCase: sl(),
        deleteOrderUseCase: sl(),
        getWarehouseUseCase: sl(),
        getWarehouseByIdUseCase: sl(),
        createOrderUseCase: sl()));
  }
}
