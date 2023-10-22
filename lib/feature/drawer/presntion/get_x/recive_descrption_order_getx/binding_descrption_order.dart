import 'package:get/get.dart';
import 'package:pharmcy_app/feature/drawer/presntion/get_x/recive_descrption_order_getx/controller_descrption_order.dart';

import '../../../../../injection_container.dart';

class OrderDescrptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderDescrptioncontroller(
        getorderDescrptionUseCase: sl(),
        cansleconfirmOrderUseCase: sl(),
        deleteOrderDetailUseCase: sl()));
  }
}
