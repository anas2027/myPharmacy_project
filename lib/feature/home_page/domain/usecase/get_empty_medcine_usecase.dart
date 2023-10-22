import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/medpharamcy_expired.dart';
import 'package:pharmcy_app/feature/home_page/domain/repositry/home_repositry.dart';

class GetEmptyMedcineUseCase {
  HomeRepositry homeRepositry;
  GetEmptyMedcineUseCase({required this.homeRepositry});
  Future<Either<Failure, List<MedpharamcyExpired>>> call(
      {required String phId}) async {
    return await homeRepositry.getMedpharamcyEmpty(phId: phId);
  }
}
