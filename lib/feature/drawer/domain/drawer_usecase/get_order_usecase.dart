import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/order.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_repo/drawer_repoitry.dart';

class GetOrderUsecase {
  DrawerRepositry drawerRepositry;
  GetOrderUsecase({required this.drawerRepositry});
  Future<Either<Failure, List<OrderEntity>>> call(
      {required String phId}) async {
    return await drawerRepositry.getOrder(phId: phId);
  }
}
