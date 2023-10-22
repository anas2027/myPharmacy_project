import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_repo/drawer_repoitry.dart';

class CansleconfirmOrderUseCase {
  DrawerRepositry drawerRepositry;
  CansleconfirmOrderUseCase({required this.drawerRepositry});
  Future<Either<Failure, Unit>> call({required String orderId}) async {
    return await drawerRepositry.cansleConfirmOrder(orderId: orderId);
  }
}
