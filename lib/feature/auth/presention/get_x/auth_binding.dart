import 'package:get/get.dart';
import 'package:pharmcy_app/feature/auth/presention/get_x/auth_controller.dart';
import 'package:pharmcy_app/injection_container.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(loginUseCase: sl()));
  }
}
