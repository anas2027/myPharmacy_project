import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/user_order.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_repo/drawer_repoitry.dart';

class GetUserOrderUseCase {
  DrawerRepositry drawerRepositry;
  GetUserOrderUseCase({required this.drawerRepositry});
  Future<Either<Failure, List<UserOrder>>> call({required String phId}) async {
    return await drawerRepositry.getUserOrder(phId: phId);
  }
}
