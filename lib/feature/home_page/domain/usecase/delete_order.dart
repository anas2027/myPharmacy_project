import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/home_page/domain/repositry/home_repositry.dart';

class DeleteOrderUseCase {
  HomeRepositry homeRepositry;
  DeleteOrderUseCase({required this.homeRepositry});
  Future<Either<Failure, Unit>> call({required String orderId}) async {
    return await homeRepositry.deleteCategory(orderId: orderId);
  }
}
