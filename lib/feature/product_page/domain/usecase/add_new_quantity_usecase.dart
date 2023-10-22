import 'package:dartz/dartz.dart';

import '../../../../error/failure.dart';
import '../repositry/product_repositry.dart';

class AddNewQuantityuseCase {
  ProductRepositry productRepositry;
  AddNewQuantityuseCase({required this.productRepositry});
  Future<Either<Failure, Unit>> call(String idMed, String newQantity) async {
    return await productRepositry.addnewQuantity(idMed, newQantity);
  }
}
