import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/warehouse_medcine.dart';

import '../../../../error/failure.dart';
import '../repositry/home_repositry.dart';

class GetWarehouseMedcineUseCase {
  HomeRepositry homeRepositry;
  GetWarehouseMedcineUseCase({required this.homeRepositry});
  Future<Either<Failure, List<WarehouseMedcine>>> call(
      {required int warehouse}) async {
    return await homeRepositry.getWarehouseMedcine(warehouse);
  }
}
