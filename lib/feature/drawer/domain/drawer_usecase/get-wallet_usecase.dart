// ignore_for_file: file_names, non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/wallet.dart';

import '../../../../error/failure.dart';
import '../drawer_repo/drawer_repoitry.dart';

class GetWalletUseCase {
  DrawerRepositry drawerRepositry;
  GetWalletUseCase({required this.drawerRepositry});
  Future<Either<Failure, Wallet>> call({required String ph_id}) async {
    return await drawerRepositry.getWallet(ph_id: ph_id);
  }
}
