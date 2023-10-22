// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/order_descrption.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/delete_order_detail_usecase.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/get_order_descrption_usecase.dart';

import '../../../domain/drawer_usecase/cansle_confirm_order_usecase.dart';

class OrderDescrptioncontroller extends GetxController {
  GetorderDescrptionUseCase getorderDescrptionUseCase;
  CansleconfirmOrderUseCase cansleconfirmOrderUseCase;
  DeleteOrderDetailUseCase deleteOrderDetailUseCase;
  OrderDescrptioncontroller(
      {required this.deleteOrderDetailUseCase,
      required this.getorderDescrptionUseCase,
      required this.cansleconfirmOrderUseCase});

  var orderid = Get.parameters;
  @override
  onInit() {
    super.onInit();

    getOrderDescrption(orderId: '${orderid['orderID']}');
  }

  bool isloading = true;

  List<OrderDescrtion> myorderDescrption = [];
  Future getOrderDescrption({required String orderId}) async {
    List<OrderDescrtion> refrech = [];
    myorderDescrption = refrech;
    var response = await getorderDescrptionUseCase(orderId: orderId);
    response.fold((l) => Failure, (r) => myorderDescrption.addAll(r));
    isloading = false;
    update();
  }

  bool issucssufly = false;

  Future cansleorderConfimration({required String orderId}) async {
    var response = await cansleconfirmOrderUseCase(orderId: orderId);
    var sucssuflyorfiled =
        response.fold((l) => null, (r) => issucssufly = true);
    update();
  }

  Future deleteOrderDetailmethod({required String orderDetailId}) async {
    var response = await deleteOrderDetailUseCase(orderDetailId: orderDetailId);
    var sucssuflyorfiled =
        response.fold((l) => null, (r) => issucssufly = true);
    update();
  }
}
