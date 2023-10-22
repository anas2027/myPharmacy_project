import 'package:dartz/dartz.dart';

import '../../../../error/failure.dart';
import '../repositry/home_repositry.dart';

class AddMedcineToOrderUseCase {
  HomeRepositry homeRepositry;
  AddMedcineToOrderUseCase({required this.homeRepositry});
  Future<Either<Failure, Unit>> call(
      {required String orderid,
      required String quqntity,
      required String medcineId}) async {
    return await homeRepositry.addMedcineToOrder(
        medcineId: medcineId, orderid: orderid, quqntity: quqntity);
  }
}
