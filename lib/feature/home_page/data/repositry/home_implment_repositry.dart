import 'package:pharmcy_app/error/exception.dart';
import 'package:pharmcy_app/error/network/network_info.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/feature/home_page/data/datasource/home_remote_data_source.dart';
import 'package:pharmcy_app/feature/home_page/data/model/warehouse_medcine_data_model.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/cart_medcine.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/category.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/medpharamcy_expired.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/warehouse.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/warehouse_medcine.dart';
import 'package:pharmcy_app/feature/home_page/domain/repositry/home_repositry.dart';

class HomeRepositryImp implements HomeRepositry {
  final NetworkInfo networkInfo;
  final HomeRemoteDataSorce homeRemoteDataSorce;
  HomeRepositryImp(
      {required this.homeRemoteDataSorce, required this.networkInfo});

  @override
  Future<Either<Failure, List<Warehouse>>> getWarehouse() async {
    if (await networkInfo.isconnected) {
      try {
        final remoteWarehouse = await homeRemoteDataSorce.getwarehouse();
        return Right(remoteWarehouse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteWarehouse = await homeRemoteDataSorce.getwarehouse();
        return Right(remoteWarehouse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<WarehouseMedcineModel>>> getWarehouseMedcine(
      int warehouse) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSorce.getMyMed(warehouse);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSorce.getMyMed(warehouse);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, int>> createOrder(
      {required String idph, required String idwarehouse}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSorce.createOrder(
            idph: idph, idwarehouse: idwarehouse);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSorce.createOrder(
            idph: idph, idwarehouse: idwarehouse);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addMedcineToOrder(
      {required String orderid,
      required String quqntity,
      required String medcineId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSorce.addMedcineToOrder(
            medcineId: medcineId, orderid: orderid, quqntity: quqntity);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSorce.addMedcineToOrder(
            medcineId: medcineId, orderid: orderid, quqntity: quqntity);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<CartMedcine>>> getCartMedcine(
      {required String orderId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await homeRemoteDataSorce.getCartMedcine(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await homeRemoteDataSorce.getCartMedcine(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> ConfirmCart({required String orderId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await homeRemoteDataSorce.ConfirmCartMedcine(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await homeRemoteDataSorce.ConfirmCartMedcine(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<MedCategory>>> getMedCategory() async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSorce.getMedCategor();
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSorce.getMedCategor();
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<WarehouseMedcine>>> getWarehouseMedcinebyCategor(
      {required String categoryName, required String warehouseID}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await homeRemoteDataSorce.getWarehouseMedcinebyCategor(
                categoryName: categoryName, warehouseID: warehouseID);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await homeRemoteDataSorce.getWarehouseMedcinebyCategor(
                categoryName: categoryName, warehouseID: warehouseID);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteCategory(
      {required String orderId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await homeRemoteDataSorce.deleteOrder(orderId: orderId);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await homeRemoteDataSorce.deleteOrder(orderId: orderId);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Warehouse>>> getWarehousebyCity(
      {required String city}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await homeRemoteDataSorce.getwarehousebyCategoru(category: city);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await homeRemoteDataSorce.getwarehousebyCategoru(category: city);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, int>> getTotoalprice({required String orderId}) async {
    if (await networkInfo.isconnected) {
      try {
        final totalprice =
            await homeRemoteDataSorce.getTotalPrice(orderId: orderId);
        return Right(totalprice);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final totalprice =
            await homeRemoteDataSorce.getTotalPrice(orderId: orderId);
        return Right(totalprice);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<MedpharamcyExpired>>> getMedpharamcyExpired(
      {required String phId}) async {
    if (await networkInfo.isconnected) {
      try {
        final totalprice =
            await homeRemoteDataSorce.getMedpharamcyExpired(phId: phId);
        return Right(totalprice);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final totalprice =
            await homeRemoteDataSorce.getMedpharamcyExpired(phId: phId);
        return Right(totalprice);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Warehouse>>> getWarehouseByCity(
      {required String city}) async {
    if (await networkInfo.isconnected) {
      try {
        final totalprice =
            await homeRemoteDataSorce.getWarehouseByCity(city: city);
        return Right(totalprice);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final totalprice =
            await homeRemoteDataSorce.getWarehouseByCity(city: city);
        return Right(totalprice);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<MedpharamcyExpired>>> getMedpharamcyEmpty(
      {required String phId}) async {
    if (await networkInfo.isconnected) {
      try {
        final totalprice =
            await homeRemoteDataSorce.getMedpharamcyEmpty(phId: phId);
        return Right(totalprice);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final totalprice =
            await homeRemoteDataSorce.getMedpharamcyEmpty(phId: phId);
        return Right(totalprice);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Warehouse>>> getwarehouseByid(
      {required String wareid}) async {
    if (await networkInfo.isconnected) {
      try {
        final totalprice =
            await homeRemoteDataSorce.getWarehouseById(id: wareid);
        return Right(totalprice);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final totalprice =
            await homeRemoteDataSorce.getWarehouseById(id: wareid);
        return Right(totalprice);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
