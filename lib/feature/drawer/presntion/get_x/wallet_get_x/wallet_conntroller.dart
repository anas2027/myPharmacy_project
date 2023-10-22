import 'package:get/get.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/drawer_usecase/get-wallet_usecase.dart';

class WalletController extends GetxController {
  GetWalletUseCase getWalletUseCase;
  WalletController({required this.getWalletUseCase});
  Wallet wallet = Wallet(id: 1, funds: 0, ph_id: 1);
  @override
  onInit() {
      Wallet wallet = Wallet(id: 1, funds: 0, ph_id: 1);

    super.onInit();
    getPharmcyWallet();
  }

  bool isloading = true;

  getPharmcyWallet() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var phId = sharedPreferences.getString('phId');
    var response = await getWalletUseCase(ph_id: '$phId');
    response.fold((l) => Failure,
        (r) => wallet = Wallet(id: r.id, funds: r.funds, ph_id: r.funds));
    isloading = false;
    print(wallet);
    update();
  }
}
