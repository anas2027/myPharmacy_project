import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/order_descrption.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_repo/drawer_repoitry.dart';

class GetorderDescrptionUseCase {
  DrawerRepositry drawerRepositry;
  GetorderDescrptionUseCase({required this.drawerRepositry});
  Future<Either<Failure, List<OrderDescrtion>>> call(
      {required String orderId}) async {
    return await drawerRepositry.getOrderDescrption(orderId: orderId);
  }
}
