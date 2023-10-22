import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/feature/product_page/domain/repositry/product_repositry.dart';

import '../../../../error/failure.dart';
import '../entity/product.dart';

class GetProductUseCase {
  ProductRepositry productRepositry;
  GetProductUseCase({required this.productRepositry});
  Future<Either<Failure, List<Product>>> call() async {
    return await productRepositry.getProduct();
  }
}
