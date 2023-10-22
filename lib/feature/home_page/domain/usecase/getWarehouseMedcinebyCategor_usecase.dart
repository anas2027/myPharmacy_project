// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/feature/home_page/domain/repositry/home_repositry.dart';

import '../../../../error/failure.dart';
import '../entity/warehouse_medcine.dart';

class GetWarehouseMedcinebyCategorUseCase {
  HomeRepositry homeRepositry;
  GetWarehouseMedcinebyCategorUseCase({required this.homeRepositry});
  Future<Either<Failure, List<WarehouseMedcine>>> call(
      {required String categoryName, required String warehouseID}) async {
    return await homeRepositry.getWarehouseMedcinebyCategor(
        warehouseID: warehouseID, categoryName: categoryName);
  }
}
