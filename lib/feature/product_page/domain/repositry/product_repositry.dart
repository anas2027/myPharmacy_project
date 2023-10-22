import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/product_page/domain/entity/addproduct.dart';
import 'package:pharmcy_app/feature/product_page/domain/entity/product.dart';

abstract class ProductRepositry {
  Future<Either<Failure, List<Product>>> getProduct();
  Future<Either<Failure, Unit>> addProduct(AddProduct addProduct);
  Future<Either<Failure, Unit>> editProduct(AddProduct addProduct);
  Future<Either<Failure, Unit>> deleteProduct(String id);
  Future<Either<Failure, Unit>> addnewQuantity(
      String idmed, String newquantity);
  Future<Either<Failure, Unit>> delteQuantity(String idmed, String newquantity);
}
