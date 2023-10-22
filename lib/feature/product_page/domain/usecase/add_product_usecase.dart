import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/product_page/domain/entity/addproduct.dart';

import '../repositry/product_repositry.dart';

class AddproductUseCase {
  ProductRepositry productRepositry;
  AddproductUseCase({required this.productRepositry});
  Future<Either<Failure, Unit>> call(AddProduct addProduct) async {
    return await productRepositry.addProduct(addProduct);
  }
}
