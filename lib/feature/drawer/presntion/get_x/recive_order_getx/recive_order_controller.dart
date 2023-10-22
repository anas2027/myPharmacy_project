// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/order.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/cansle_confirm_order_usecase.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/get_order_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/delete_order.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReciveOrderController extends GetxController {
  GetOrderUsecase getOrderUsecase;
  CansleconfirmOrderUseCase cansleconfirmOrderUseCase;
  DeleteOrderUseCase deleteOrderUseCase;
  ReciveOrderController(
      {required this.getOrderUsecase,
      required this.cansleconfirmOrderUseCase,
      required this.deleteOrderUseCase});
  List<OrderEntity> myOrder = [];
  @override
  onInit() {
    super.onInit();
    getOrder();
  }

  bool isloading = true;

  Future getOrder() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var phId = sharedPreferences.getString('phId');
    List<OrderEntity> myrefrech = [];
    myOrder = myrefrech;
    var response = await getOrderUsecase(phId: '$phId');
    response.fold((l) => Failure, (r) => myOrder.addAll(r));
    bool isloading = false;

    update();
  }

  bool issucssufly = false;

  Future deleteorder({required String orderID}) async {
    return await deleteOrderUseCase(orderId: orderID);
  }

  Future cansleorderConfimration({required String orderId}) async {
    var response = await cansleconfirmOrderUseCase(orderId: orderId);
    var sucssuflyorfiled =
        response.fold((l) => null, (r) => issucssufly = true);
    update();
  }
}
