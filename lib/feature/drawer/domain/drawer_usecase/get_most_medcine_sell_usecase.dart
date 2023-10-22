import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/most_medcine_sold_.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_repo/drawer_repoitry.dart';
import 'package:pharmcy_app/feature/home_page/domain/repositry/home_repositry.dart';

class MostMedcineSoldUseCase {
  DrawerRepositry drawerRepositry;
  MostMedcineSoldUseCase({required this.drawerRepositry});
  Future<Either<Failure,List<MostMedcineSold>>>call()async{
    return await drawerRepositry.mostMedcineSold();
  }
}