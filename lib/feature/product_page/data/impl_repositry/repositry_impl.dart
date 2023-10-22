import 'package:pharmcy_app/feature/product_page/data/datasource/remote_data_source.dart';
import 'package:pharmcy_app/feature/product_page/data/model/add_or_edit_data_model.dart';
import 'package:pharmcy_app/feature/product_page/domain/entity/addproduct.dart';
import 'package:pharmcy_app/feature/product_page/domain/entity/product.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/feature/product_page/domain/repositry/product_repositry.dart';

import '../../../../error/exception.dart';
import '../../../../error/network/network_info.dart';

class ProductRepoImpl extends ProductRepositry {
  final NetworkInfo networkInfo;
  final ProoductRemoteDataSource productRemoteDataSorce;
  ProductRepoImpl(
      {required this.productRemoteDataSorce, required this.networkInfo});
  @override
  Future<Either<Failure, List<Product>>> getProduct() async {
    if (await networkInfo.isconnected) {
      try {
        final remoteproduct = await productRemoteDataSorce.getProduct();
        return Right(remoteproduct);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteproduct = await productRemoteDataSorce.getProduct();
        return Right(remoteproduct);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addProduct(AddProduct addProduct) async {
    AddProductDataModel addProductDataModel = AddProductDataModel(
        description: addProduct.description,
        images: addProduct.images,
        name: addProduct.name,
        price: addProduct.price,
        quantity: addProduct.quantity,
        pharmacy_id: addProduct.pharmacy_id);
    if (await networkInfo.isconnected) {
      try {
        final remoteWarehouse =
            await productRemoteDataSorce.addProduct(addProductDataModel);
        return Right(remoteWarehouse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteWarehouse =
            await productRemoteDataSorce.addProduct(addProductDataModel);
        return Right(remoteWarehouse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> editProduct(AddProduct addProduct) async {
    AddProductDataModel addProductDataModel = AddProductDataModel(
        description: addProduct.description,
        images: addProduct.images,
        name: addProduct.name,
        price: addProduct.price,
        quantity: addProduct.quantity,
        pharmacy_id: addProduct.pharmacy_id);
    if (await networkInfo.isconnected) {
      try {
        final remoteWarehouse =
            await productRemoteDataSorce.editProduct(addProductDataModel);
        return Right(remoteWarehouse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteWarehouse =
            await productRemoteDataSorce.editProduct(addProductDataModel);
        return Right(remoteWarehouse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(String id) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteWarehouse = await productRemoteDataSorce.deleteProduct(id);
        return Right(remoteWarehouse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteWarehouse = await productRemoteDataSorce.deleteProduct(id);
        return Right(remoteWarehouse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addnewQuantity(
      String idmed, String newquantity) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteWarehouse =
            await productRemoteDataSorce.addnewQuantity(idmed, newquantity);
        return Right(remoteWarehouse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteWarehouse =
            await productRemoteDataSorce.addnewQuantity(idmed, newquantity);
        return Right(remoteWarehouse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> delteQuantity(
      String idmed, String newquantity) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteWarehouse =
            await productRemoteDataSorce.deletenewQuantity(idmed, newquantity);
        return Right(remoteWarehouse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteWarehouse =
            await productRemoteDataSorce.deletenewQuantity(idmed, newquantity);
        return Right(remoteWarehouse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
