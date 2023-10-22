import 'package:dartz/dartz.dart';

import '../../../../error/failure.dart';
import '../entity/addproduct.dart';
import '../repositry/product_repositry.dart';

class EditproductUseCase {
  ProductRepositry productRepositry;
  EditproductUseCase({required this.productRepositry});
  Future<Either<Failure, Unit>> call(AddProduct addProduct) async {
    return await productRepositry.editProduct(addProduct);
  }
}
