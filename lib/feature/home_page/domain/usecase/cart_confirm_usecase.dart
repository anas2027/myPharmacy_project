import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/feature/home_page/domain/repositry/home_repositry.dart';

import '../../../../error/failure.dart';

class CartConfirmUsecase {
  HomeRepositry homeRepositry;
  CartConfirmUsecase({required this.homeRepositry});
  Future<Either<Failure, Unit>> call({required String orderId}) async {
    return await homeRepositry.ConfirmCart(orderId: orderId);
  }
}
