import 'package:get/get.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/most_medcine_sold_.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/get_most_medcine_sell_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/warehouse.dart';

class DashBoardController extends GetxController {
  MostMedcineSoldUseCase mostMedcineSoldUseCase;
  DashBoardController({required this.mostMedcineSoldUseCase});
   @override
  onInit() {
    super.onInit();
    getmostMedcine();
  }

  List<MostMedcineSold> medcineSold =[];
  getmostMedcine()async{
    medcineSold.clear();
    var response = await mostMedcineSoldUseCase();
    response.fold((l) => Failure, (r) => medcineSold.addAll(r));
    update();
    print(medcineSold);

  }
  List<Warehouse> warehouse = [];
  bool isloading = true;
  getmostuserpurshed() {}
}
