import 'package:dartz/dartz.dart';
import '../../../../error/failure.dart';
import '../entity/warehouse.dart';
import '../repositry/home_repositry.dart';

class GetWarehouseUseCase {
  HomeRepositry homeRepositry;
  GetWarehouseUseCase({required this.homeRepositry});
  Future<Either<Failure, List<Warehouse>>> call() async {
    return await homeRepositry.getWarehouse();
  }
}
