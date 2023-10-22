import 'package:get/get.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/medpharamcy_expired.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/get_empty_medcine_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/usecase/get_medcine_abouttoexpierd_usecase.dart';

class AlertController extends GetxController {
  GetMedcineAboutToExpiredUseCase getMedcineAboutToExpired;
  GetEmptyMedcineUseCase getEmptyMedcineUseCase;
  AlertController(
      {required this.getMedcineAboutToExpired,
      required this.getEmptyMedcineUseCase});
  bool isloading = false;
  List<MedpharamcyExpired> medabouttoExpiredList = [];
  Future getMedpharamcyExpired() async {
    List<MedpharamcyExpired> refrech = [];
    medabouttoExpiredList = refrech;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var phId = sharedPreferences.getString('phId');
    var response = await getMedcineAboutToExpired(phId: '$phId');
    response.fold((l) => Failure, (r) => medabouttoExpiredList.addAll(r));
    isloading = true;
    update();
    print(medabouttoExpiredList);
  }

  @override
  onInit() {
    super.onInit();
    getMedpharamcyExpired();
    getoutOfquantityMedcine();
  }

  List<MedpharamcyExpired> qunatityMedcineOut = [];
  int currentIndex = 0;
  Future getoutOfquantityMedcine() async {
    List<MedpharamcyExpired> refrech = [];
    qunatityMedcineOut = refrech;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var phId = sharedPreferences.getString('phId');
    var resposne = await getEmptyMedcineUseCase(phId: '$phId');
    resposne.fold((l) => Failure, (r) => qunatityMedcineOut.addAll(r));
    print(medabouttoExpiredList);
    isloading = true;
    update();
  }

  bodyChange({required int value}) {
    currentIndex = value;
    value == 1 ? getMedpharamcyExpired() : getoutOfquantityMedcine();
    update();
  }
}
