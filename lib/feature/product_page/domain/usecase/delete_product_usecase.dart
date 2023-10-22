import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/product_page/domain/repositry/product_repositry.dart';

class DeleteProductUsecase {
  ProductRepositry productRepositry;
  DeleteProductUsecase({required this.productRepositry});
  Future<Either<Failure, Unit>> call(String id) async {
    return await productRepositry.deleteProduct(id);
  }
}
