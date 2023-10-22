// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'dart:async';

import 'package:get/get.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/delete_order_detail_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/cart_medcine.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/cart_confirm_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/get_totalprice_usecase.dart';

import '../../../domain/usecase/get_medcine_cart_usecase.dart';

class CartController extends GetxController {
  GetMedcineCartuseCase getMedcineCartuseCase;
  CartConfirmUsecase cartConfirmUsecase;
  GetTotalPriceUseCase getTotalPriceUseCase;
  DeleteOrderDetailUseCase deleteOrderDetailUseCase;
  CartController(
      {required this.deleteOrderDetailUseCase,
      required this.getMedcineCartuseCase,
      required this.cartConfirmUsecase,
      required this.getTotalPriceUseCase});

  //counter
  Timer? timer;
  int counter = 1;

  void onLongPressSUm(int quantity) {
    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      update();

      quantity++;
      update();
    });
  }

  void onLongPressSumCanscle() {
    update();
    timer?.cancel();
    update();
  }

  void countersum(int quantity) {
    quantity++;
    update();
  }
  // min counter

  void counterMin(int quantity) {
    quantity--;
    update();
  }

  void onLongPressMin(int quantity) {
    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      update();

      quantity--;
      update();
    });
  }

  void onLongPressMinCanscle(int quantity) {
    timer?.cancel();
  }

//////////////////////////////////////////// get cart Medcine ///////////////////////////////////////////////////////////////////////
  List<CartMedcine> myCart = [];
  bool isloadingcart = true;
  Future getcartMedcine({required String orderId}) async {
    List<CartMedcine> refrechList = [];
    myCart = refrechList;
    final mymedcine = await getMedcineCartuseCase(orderId: orderId);
    mymedcine.fold((l) => Failure, (r) => myCart.addAll(r));
    isloadingcart = false;
    update();
  }

  // oninit//
  var data = Get.parameters;

  @override
  onInit() {
    getTotalPrice(orderId: '${data['orderId']}');
    super.onInit();
    getcartMedcine(orderId: '${data['orderId']}');
  }

  Future CofirmCart({required String orderId}) async {
    await cartConfirmUsecase(orderId: orderId);
  }

  int TotalPrice = 1;
  Future getTotalPrice({required String orderId}) async {
    var response = await getTotalPriceUseCase(orderId: orderId);
    response.fold((l) => Failure, (r) => TotalPrice = r);
    update();
  }

  bool issucssufly = false;
  Future deleteOrderDetailmethod({required String orderDetailId}) async {
    var response = await deleteOrderDetailUseCase(orderDetailId: orderDetailId);
    var sucssuflyorfiled =
        response.fold((l) => null, (r) => issucssufly = true);
    update();
  }
}
