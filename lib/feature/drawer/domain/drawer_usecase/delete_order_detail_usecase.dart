import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_repo/drawer_repoitry.dart';

class DeleteOrderDetailUseCase {
  DrawerRepositry drawerRepositry;
  DeleteOrderDetailUseCase({required this.drawerRepositry});
  Future<Either<Failure, Unit>> call({required String orderDetailId}) async {
    return await drawerRepositry.deleteorderdetail(
        orderDetailId: orderDetailId);
  }
}
