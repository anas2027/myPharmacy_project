import 'package:get/get.dart';
import 'package:pharmcy_app/feature/home_page/presention/get_x/cart_getx/cart_controller.dart';

import '../../../../../injection_container.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController(
        getMedcineCartuseCase: sl(),
        cartConfirmUsecase: sl(),
        getTotalPriceUseCase: sl(),
        deleteOrderDetailUseCase: sl()));
  }
}
