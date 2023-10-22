import 'package:get/get.dart';
import 'package:pharmcy_app/injection_container.dart';

import 'home_page_controller.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
        HomePageController(
            getWarehouseUseCase: sl(),
            createOrderUseCase: sl(),
            getWarehouseMedcinebyCategorUseCase: sl(),
            getWarehouseByCategory: sl()),
        permanent: false);
  }
}
