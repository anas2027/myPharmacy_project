import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/mdecine_page/domain/repositry/medcine_repositry.dart';

class DeleteMedcineUseCase {
  MyMedcineRepositry medcineRepositry;
  DeleteMedcineUseCase({required this.medcineRepositry});
  Future<Either<Failure,Unit>>call({required String medId})async{
    return await medcineRepositry.deleteMedcine(medId: medId);
  }
}