import 'package:get/get.dart';
import 'package:pharmcy_app/feature/drawer/presntion/get_x/wallet_get_x/wallet_conntroller.dart';
import 'package:pharmcy_app/injection_container.dart';

class WalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WalletController(getWalletUseCase: sl()));
  }
}
