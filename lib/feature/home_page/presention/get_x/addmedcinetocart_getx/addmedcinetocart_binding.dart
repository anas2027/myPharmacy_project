import 'package:get/get.dart';
import 'package:pharmcy_app/feature/home_page/presention/get_x/addmedcinetocart_getx/addmedcinetocart_controller.dart';

import '../../../../../injection_container.dart';

class AddmedcinetocartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddMedcineToCartController(
        addMedcineToOrderUseCase: sl(), image: sl()));
  }
}
