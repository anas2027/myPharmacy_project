import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/warehouse.dart';
import 'package:pharmcy_app/feature/home_page/domain/repositry/home_repositry.dart';

class GetWarehouseByIdUseCase {
  HomeRepositry homeRepositry;
  GetWarehouseByIdUseCase({required this.homeRepositry});
  Future<Either<Failure, List<Warehouse>>> call(
      {required String wareId}) async {
    return homeRepositry.getwarehouseByid(wareid: wareId);
  }
}
