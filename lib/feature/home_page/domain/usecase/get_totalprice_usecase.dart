import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/home_page/domain/repositry/home_repositry.dart';

class GetTotalPriceUseCase {
  final HomeRepositry homeRepositry;
  GetTotalPriceUseCase({required this.homeRepositry});
  Future<Either<Failure, int>> call({required String orderId}) async {
    return await homeRepositry.getTotoalprice(orderId: orderId);
  }
}
