import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_repo/drawer_repoitry.dart';

class ConfrimUserOrderDetailUSeCase {
  DrawerRepositry drawerRepositry;
  ConfrimUserOrderDetailUSeCase({required this.drawerRepositry});
  Future<Either<Failure, Unit>> call({required String orderIdDetail}) async {
    return await drawerRepositry.confirmUsermedOrderDetail(
        orderDetailId: orderIdDetail);
  }
}
