// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/cart_medcine.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/category.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/medpharamcy_expired.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/warehouse.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/warehouse_medcine.dart';

import '../../../../error/failure.dart';

abstract class HomeRepositry {
  Future<Either<Failure, List<Warehouse>>> getWarehouse();
  Future<Either<Failure, List<WarehouseMedcine>>> getWarehouseMedcine(int id);
  Future<Either<Failure, List<WarehouseMedcine>>> getWarehouseMedcinebyCategor(
      {required String categoryName, required String warehouseID});

  Future<Either<Failure, int>> createOrder(
      {required String idph, required String idwarehouse});
  Future<Either<Failure, Unit>> addMedcineToOrder(
      {required String orderid,
      required String quqntity,
      required String medcineId});

  Future<Either<Failure, List<CartMedcine>>> getCartMedcine(
      {required String orderId});

  Future<Either<Failure, Unit>> ConfirmCart({required String orderId});
  Future<Either<Failure, List<MedCategory>>> getMedCategory();
  Future<Either<Failure, Unit>> deleteCategory({required String orderId});

  Future<Either<Failure, int>> getTotoalprice({required String orderId});
  Future<Either<Failure, List<Warehouse>>> getWarehouseByCity(
      {required String city});
  Future<Either<Failure, List<MedpharamcyExpired>>> getMedpharamcyExpired(
      {required String phId});
  Future<Either<Failure, List<MedpharamcyExpired>>> getMedpharamcyEmpty(
      {required String phId});
  Future<Either<Failure, List<Warehouse>>> getwarehouseByid(
      {required String wareid});
}
