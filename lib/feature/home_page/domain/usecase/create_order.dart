import 'package:dartz/dartz.dart';

import '../../../../error/failure.dart';
import '../repositry/home_repositry.dart';

class CreateOrderUseCase {
  HomeRepositry homeRepositry;
  CreateOrderUseCase({required this.homeRepositry});
  Future<Either<Failure, int>> call(
      {required String idph, required String idwarehouse}) async {
    return await homeRepositry.createOrder(
        idph: idph, idwarehouse: idwarehouse);
  }
}
