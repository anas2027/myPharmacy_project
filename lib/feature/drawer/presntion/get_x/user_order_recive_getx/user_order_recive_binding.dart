import 'package:get/get.dart';
import 'package:pharmcy_app/injection_container.dart';

import 'user_order_recive_controller.dart';

class UserOrderReciveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserOderReciveController(getUserOrderUseCase: sl()));
  }
}
