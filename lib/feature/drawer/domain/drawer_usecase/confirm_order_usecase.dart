import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_repo/drawer_repoitry.dart';

import '../../../../error/failure.dart';

class ConfirmOrderUseCase {
  DrawerRepositry drawerRepositry;
  ConfirmOrderUseCase({required this.drawerRepositry});
  Future<Either<Failure, Unit>> call({required String orderId}) async {
    return await drawerRepositry.confirmOrder(orderId: orderId);
  }
}
