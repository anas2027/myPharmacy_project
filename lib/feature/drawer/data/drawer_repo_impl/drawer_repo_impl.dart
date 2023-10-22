// ignore_for_file: non_constant_identifier_names

import 'package:pharmcy_app/error/network/network_info.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/most_medcine_sold_.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/order.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/order_descrption.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/rachita.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/user_order.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/user_order_detail.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/wallet.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_repo/drawer_repoitry.dart';

import '../../../../error/exception.dart';
import '../drawer_remote_data_source/drawer_remote_data_source.dart';

class DrawerRepoImpl implements DrawerRepositry {
  final NetworkInfo networkInfo;
  final DrawerRemoteDataSource drawerRemoteDataSource;
  DrawerRepoImpl(
      {required this.drawerRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, Wallet>> getWallet({required String ph_id}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await drawerRemoteDataSource.getwallet(ph_id: ph_id);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await drawerRemoteDataSource.getwallet(ph_id: ph_id);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrder(
      {required String phId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await drawerRemoteDataSource.getOrder(phId: phId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await drawerRemoteDataSource.getOrder(phId: phId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<OrderDescrtion>>> getOrderDescrption(
      {required String orderId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await drawerRemoteDataSource.getOrderDescrption(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await drawerRemoteDataSource.getOrderDescrption(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> cansleConfirmOrder(
      {required String orderId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await drawerRemoteDataSource
            .cansleConfirmatonOrder(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await drawerRemoteDataSource
            .cansleConfirmatonOrder(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> confirmOrder({required String orderId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await drawerRemoteDataSource.ConfirmatonOrder(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await drawerRemoteDataSource.ConfirmatonOrder(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteorderdetail(
      {required String orderDetailId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await drawerRemoteDataSource.deleteOrderDetail(
            deleteorderDetail: orderDetailId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await drawerRemoteDataSource.deleteOrderDetail(
            deleteorderDetail: orderDetailId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<UserOrder>>> getUserOrder(
      {required String phId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await drawerRemoteDataSource.getuserOrder(phId: phId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await drawerRemoteDataSource.getuserOrder(phId: phId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<UserProductOrderDetail>>>
      getUserProductorderDetail({required String orderId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await drawerRemoteDataSource
            .getUserProductorderDetail(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await drawerRemoteDataSource
            .getUserProductorderDetail(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<UserMedcineOrderDetail>>>
      getUsermedcineorderDetail({required String orderId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await drawerRemoteDataSource
            .getUsermedcineorderDetail(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await drawerRemoteDataSource
            .getUsermedcineorderDetail(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> confirmUsermedOrderDetail(
      {required String orderDetailId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await drawerRemoteDataSource
            .confirmUserMedcineOrderDetail(orderDetail: orderDetailId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await drawerRemoteDataSource
            .confirmUserMedcineOrderDetail(orderDetail: orderDetailId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
 @override
  Future<Either<Failure, List<Rachita>>> getRachitaImage({required String id}) async{
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await drawerRemoteDataSource
            .getRachitaImage(id: id);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await drawerRemoteDataSource
            .getRachitaImage(id: id);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<MostMedcineSold>>> mostMedcineSold()async {
   if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await drawerRemoteDataSource
            .mostMedcineSold();
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await drawerRemoteDataSource
            .mostMedcineSold();
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
