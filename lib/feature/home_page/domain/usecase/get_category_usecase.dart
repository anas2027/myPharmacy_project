import 'package:dartz/dartz.dart';

import '../../../../error/failure.dart';
import '../entity/category.dart';
import '../repositry/home_repositry.dart';

class CategoryUseCase {
  HomeRepositry homeRepositry;
  CategoryUseCase({required this.homeRepositry});
  Future<Either<Failure, List<MedCategory>>> call() async {
    return await homeRepositry.getMedCategory();
  }
}
