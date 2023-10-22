import 'package:get/get.dart';
import 'package:pharmcy_app/feature/home_page/presention/get_x/alert_getx/alert_controller.dart';
import 'package:pharmcy_app/injection_container.dart';

class AlertBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AlertController(
        getMedcineAboutToExpired: sl(), getEmptyMedcineUseCase: sl()));
  }
}
