import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/cart_medcine.dart';
import 'package:pharmcy_app/feature/home_page/domain/repositry/home_repositry.dart';

class GetMedcineCartuseCase {
  HomeRepositry homeRepositry;
  GetMedcineCartuseCase({required this.homeRepositry});
  Future<Either<Failure, List<CartMedcine>>> call(
      {required String orderId}) async {
    return await homeRepositry.getCartMedcine(orderId: orderId);
  }
}
