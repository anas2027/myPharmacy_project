
import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/rachita.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_repo/drawer_repoitry.dart';

class GetRachetaImageUsecase{
  DrawerRepositry drawerRepositry;
  GetRachetaImageUsecase({required this.drawerRepositry});
  Future<Either<Failure,List<Rachita>>>call({required String id })async{
    return await drawerRepositry.getRachitaImage(id: id);
  }
}