import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/feature/product_page/domain/repositry/product_repositry.dart';

import '../../../../error/failure.dart';

class DeleteNewQuantity {
  ProductRepositry productRepositry;
  DeleteNewQuantity({required this.productRepositry});
  Future<Either<Failure, Unit>> call(
      {required String idMed, required String newQantity}) async {
    return await productRepositry.delteQuantity(idMed, newQantity);
  }
}
