import 'package:get/get.dart';
import 'package:pharmcy_app/feature/product_page/presntion/getx_product_feature/my_product_controller.dart';
import 'package:pharmcy_app/injection_container.dart';

class MyProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MyProductController(
        getProductUseCase: sl(),
        deleteProductUsecase: sl(),
        addNewQuantityuseCase: sl(),
        categoryUseCase: sl(),
        deleteNewQuantity: sl()));
  }
}
