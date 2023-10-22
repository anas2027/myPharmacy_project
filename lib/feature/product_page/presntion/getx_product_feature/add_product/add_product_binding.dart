import 'package:get/get.dart';
import 'package:pharmcy_app/feature/product_page/presntion/getx_product_feature/add_product/add_product_controller.dart';
import 'package:pharmcy_app/injection_container.dart';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddProductContoller(addproductUseCase: sl()));
  }
}
