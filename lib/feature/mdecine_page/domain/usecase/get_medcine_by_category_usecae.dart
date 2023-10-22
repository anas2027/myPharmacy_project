import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/mdecine_page/domain/entity/my_medcine.dart';
import 'package:pharmcy_app/feature/mdecine_page/domain/repositry/medcine_repositry.dart';

class GetMedcineByCategoryUseCase{
  MyMedcineRepositry medcineRepositry;
  GetMedcineByCategoryUseCase({required this.medcineRepositry});
  Future<Either<Failure,List<MyMedcine>>>call({required String phId,required String nameCategory})async{
 return await    medcineRepositry.getMedByCategory(phId: phId, nameCategory: nameCategory);
  }
}