import 'package:get/get.dart';
import 'package:pharmcy_app/feature/mdecine_page/presention/getx_medcine_feature/my_medcine_controller.dart';
import 'package:pharmcy_app/injection_container.dart';

class MyMedcineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MyMedcineController(
        myMedcineUseCase: sl(),
        deleteMedcineUseCase: sl(),
        categoryUseCase: sl(),
        getMedcineByCategoryUseCase: sl(),
        deleteQuantityOfMedcine: sl()));
  }
}
