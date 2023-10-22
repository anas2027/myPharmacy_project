// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/mdecine_page/domain/entity/my_medcine.dart';
import 'package:pharmcy_app/feature/mdecine_page/domain/usecase/delete_medcine_usecase.dart';
import 'package:pharmcy_app/feature/mdecine_page/domain/usecase/get_medcine_by_category_usecae.dart';
import 'package:pharmcy_app/feature/mdecine_page/domain/usecase/get_my_medcine_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../home_page/domain/entity/category.dart';
import '../../../home_page/domain/usecase/get_category_usecase.dart';
import '../../domain/usecase/delete_qunatity_medcine_usecase.dart';

class MyMedcineController extends GetxController {
  GetMyMedcineUseCase myMedcineUseCase;
  CategoryUseCase categoryUseCase;
  DeleteQuantityOfMedcine deleteQuantityOfMedcine;
  DeleteMedcineUseCase deleteMedcineUseCase;
  GetMedcineByCategoryUseCase getMedcineByCategoryUseCase;
  MyMedcineController(
      {required this.myMedcineUseCase,
      required this.getMedcineByCategoryUseCase,
      required this.deleteMedcineUseCase,
      required this.categoryUseCase,
      required this.deleteQuantityOfMedcine});
  var currentIndex = 0.obs;
  void changePage(int index) {
    currentIndex.value = index;
    if (index == 0) {
    } else if (index == 1) {
      Get.offAllNamed('/homePage');
    } else {
      Get.offAllNamed('/MyProduct');
    }
  }

  @override
  onInit() {
    super.onInit();
    GetMyMedcineList();
    getCategory();
  }

//////////////////// delete medcine ////////////////////
  deleteMedcine({required String medId})async{
    deleteMedcineUseCase(medId: medId);
        GetMyMedcineList();

  }

  // get ph name //////////////////////////////////////////////////////////////////
  Future<String> getphName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var namephr = sharedPreferences.get('phname');
    String nameph = '$namephr';
    return nameph;
  }
  // get Medcien liat //////////////////////////////////////////////////////////////////

  bool isLoading = true;
  List<MyMedcine> myMedcineList = [];
  Future GetMyMedcineList() async {
   myMedcineList.clear();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var phId = sharedPreferences.get('phId');
    String phid = '$phId';
    final medorfailire = await myMedcineUseCase(phId: phid);
    medorfailire.fold((l) => Failure, (r) => myMedcineList.addAll(r));
    isLoading = false;
    update();
  }
  // appbar list  //////////////////////////////////////////////////////////////////

  int currentindex = 0;
  void changecurrentindex({required int index}) {
    currentindex = index;
    update();
  }
  // get Category //////////////////////////////////////////////////////////////////

  List<MedCategory> category = [];

  getCategory() async {
    List<MedCategory> refrech = [];
    category = refrech;
    var response = await categoryUseCase();
    response.fold((l) => Failure, (r) => category.addAll(r));
    update();
  }

  int newquanityt = 1;
  deleteQuanityofMedcieMethod(
      {required String medId, required String requested_quantity}) async {
    await deleteQuantityOfMedcine(
        medId: medId, requested_quantity: requested_quantity);
  }
  /////////////////////// GetMedc  bycategory 

 getMedByCategory({required String catenam})async{
  myMedcineList.clear();
  print(catenam);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var phId = sharedPreferences.get('phId');
    String phid = '$phId';
  var response =  await getMedcineByCategoryUseCase(nameCategory: catenam, phId: phid);
  response.fold((l) => Failure, (r) =>myMedcineList.addAll(r) );
  update();
 }

}
