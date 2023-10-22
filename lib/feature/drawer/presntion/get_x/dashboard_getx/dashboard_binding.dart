import 'package:get/get.dart';
import 'package:pharmcy_app/feature/drawer/presntion/get_x/dashboard_getx/dashboard_controller.dart';
import 'package:pharmcy_app/injection_container.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashBoardController(mostMedcineSoldUseCase: sl()));
  }
}
