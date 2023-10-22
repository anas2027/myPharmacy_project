import 'package:get/get.dart';
import 'package:pharmcy_app/feature/drawer/presntion/get_x/user_order_recive_detail_getx/user_order_recive_detail_controller.dart';
import 'package:pharmcy_app/injection_container.dart';

class UserOrderReciveDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserOrderReciveDetailController(
        confrimUserOrderDetailUSeCase: sl(),
        getRachetaImageUsecase: sl(),
        getUserMedcienOrderDetailUseCase: sl(),
        getUserProductOrderDetailUseCase: sl()));
  }
}
