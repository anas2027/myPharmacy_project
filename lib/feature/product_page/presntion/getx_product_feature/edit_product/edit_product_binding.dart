import 'package:get/get.dart';
import 'package:pharmcy_app/injection_container.dart';

import 'edit_product_controller.dart';

class EditProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProductController(editproductUseCase: sl()));
  }
}
