import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/user_order_detail.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_repo/drawer_repoitry.dart';

class GetUserProductOrderDetailUseCase {
  DrawerRepositry drawerRepositry;
  GetUserProductOrderDetailUseCase({required this.drawerRepositry});
  Future<Either<Failure, List<UserProductOrderDetail>>> call(
      {required String orderId}) async {
    return await drawerRepositry.getUserProductorderDetail(orderId: orderId);
  }
}
