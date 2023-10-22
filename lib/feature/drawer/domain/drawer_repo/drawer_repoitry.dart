// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/most_medcine_sold_.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/order.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/order_descrption.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/rachita.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/user_order.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/user_order_detail.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/wallet.dart';

abstract class DrawerRepositry {
  Future<Either<Failure, Wallet>> getWallet({required String ph_id});
  Future<Either<Failure, List<OrderEntity>>> getOrder({required String phId});
  Future<Either<Failure, List<OrderDescrtion>>> getOrderDescrption(
      {required String orderId});
  Future<Either<Failure, Unit>> cansleConfirmOrder({required String orderId});
  Future<Either<Failure, Unit>> confirmOrder({required String orderId});
  Future<Either<Failure, Unit>> deleteorderdetail(
      {required String orderDetailId});
  Future<Either<Failure, List<UserOrder>>> getUserOrder({required String phId});
  Future<Either<Failure, List<UserMedcineOrderDetail>>>
      getUsermedcineorderDetail({required String orderId});
  Future<Either<Failure, List<UserProductOrderDetail>>>
      getUserProductorderDetail({required String orderId});
  Future<Either<Failure, Unit>> confirmUsermedOrderDetail(
      {required String orderDetailId});
            Future<Either<Failure,List<Rachita>>>getRachitaImage({required String id });
                        Future<Either<Failure,List<MostMedcineSold>>>mostMedcineSold();


}
