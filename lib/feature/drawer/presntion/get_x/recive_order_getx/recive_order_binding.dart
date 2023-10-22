import 'package:get/get.dart';
import 'package:pharmcy_app/feature/drawer/presntion/get_x/recive_order_getx/recive_order_controller.dart';

import '../../../../../injection_container.dart';

class ReciveOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ReciveOrderController(
        getOrderUsecase: sl(),
        cansleconfirmOrderUseCase: sl(),
        deleteOrderUseCase: sl()));
  }
}
