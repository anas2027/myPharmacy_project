// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:get/get.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/get_category_usecase.dart';
import 'package:pharmcy_app/feature/product_page/domain/entity/product.dart';
import 'package:pharmcy_app/feature/product_page/domain/usecase/add_new_quantity_usecase.dart';
import 'package:pharmcy_app/feature/product_page/domain/usecase/delete_new_qnatity_usecase.dart';
import 'package:pharmcy_app/feature/product_page/domain/usecase/delete_product_usecase.dart';
import 'package:pharmcy_app/feature/product_page/domain/usecase/get_product_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../error/failure.dart';
import '../../../home_page/domain/entity/category.dart';

class MyProductController extends GetxController {
  CategoryUseCase categoryUseCase;
  final GetProductUseCase getProductUseCase;
  final DeleteProductUsecase deleteProductUsecase;
  final AddNewQuantityuseCase addNewQuantityuseCase;
  final DeleteNewQuantity deleteNewQuantity;
  MyProductController(
      {required this.getProductUseCase,
      required this.deleteProductUsecase,
      required this.addNewQuantityuseCase,
      required this.categoryUseCase,
      required this.deleteNewQuantity});
  var currentIndex = 2.obs;
  void changePage(int index) {
    currentIndex.value = index;
    if (index == 0) {
      Get.offAllNamed('/MyMedcinePage');
    } else if (index == 1) {
      Get.offAllNamed('/homePage');
    } else {}
  }

  @override
  onInit() {
    super.onInit();
    getProduct();
    getCategory();
  }

  bool isloading = true;
  List<Product> productlist = [];
  Future getProduct() async {
    List<Product> refr = [];
    productlist = refr;

    var respone = await getProductUseCase();
    respone.fold((l) => Failure, (r) => productlist.addAll(r));

    isloading = false;

    update();
  }

  Timer? timer;
  int counter = 1;

  void onLongPressSUm() {
    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      update();

      counter++;
      update();
    });
  }

  void onLongPressSumCanscle() {
    update();
    timer?.cancel();
    update();
  }

  void countersum() {
    counter++;
    update();
  }
  // min counter

  void counterMin() {
    counter--;
    update();
  }

  void onLongPressMin() {
    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      update();

      counter--;
      update();
    });
  }

  void onLongPressMinCanscle() {
    timer?.cancel();
  }

  Future deleteMedcine({required int idMed}) async {
    List<Product> newList = [];
    productlist = newList;
    deleteProductUsecase('$idMed');
    var respone = await getProductUseCase();
    respone.fold((l) => Failure, (r) => productlist.addAll(r));
    if (productlist.isEmpty) {
      isloading = false;
    }
    update();
  }

  Future refrechscreenandproducut() async {
    List<Product> newList = [];
    productlist = newList;
    var respone = await getProductUseCase();
    respone.fold((l) => Failure, (r) => productlist.addAll(r));
    if (productlist.isEmpty) {
      isloading = false;
    }
    update();
  }

  Future<String> getphName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var namephr = sharedPreferences.get('phname');
    String nameph = '$namephr';
    return nameph;
  }

  addnewQunatity({required String idMed, required String newQuantity}) async {
    addNewQuantityuseCase(idMed, newQuantity);
  }

  int currentindex = 0;
  void changecurrentindex({required int index}) {
    currentindex = index;
    update();
  }

  List<MedCategory> category = [];

  getCategory() async {
    List<MedCategory> refrech = [];
    category = refrech;
    var response = await categoryUseCase();
    response.fold((l) => Failure, (r) => category.addAll(r));
    update();
  }

  DelteNewQuantity({required String idMed, required String newQuantity}) {
    deleteNewQuantity(idMed: idMed, newQantity: newQuantity);
  }
}
