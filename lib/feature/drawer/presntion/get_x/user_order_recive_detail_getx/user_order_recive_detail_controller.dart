import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/rachita.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/user_order_detail.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/confirm_user_med_order-detail.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/get_rachita_usecase.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/get_user_medcine_order_detail.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/get_user_product_order_detail.dart';

class UserOrderReciveDetailController extends GetxController {
  GetUserMedcienOrderDetailUseCase getUserMedcienOrderDetailUseCase;
  GetUserProductOrderDetailUseCase getUserProductOrderDetailUseCase;
  ConfrimUserOrderDetailUSeCase confrimUserOrderDetailUSeCase;
  GetRachetaImageUsecase getRachetaImageUsecase;
  UserOrderReciveDetailController(
      {required this.getUserMedcienOrderDetailUseCase,
      required this.getRachetaImageUsecase,
      required this.confrimUserOrderDetailUSeCase,
      required this.getUserProductOrderDetailUseCase});
  @override
  onInit() async {
    super.onInit();
    getuserordermedcien();
    getuserorderProduct();
    getipaddres();
  }

  bool isloading = false;
  List<UserMedcineOrderDetail> userorderMedcine = [];
  var orderid = Get.parameters;
  getuserordermedcien() async {
    String orderId = '${orderid['orderId']}';

    print(orderId);
    List<UserMedcineOrderDetail> refrech = [];
    userorderMedcine = refrech;

    var response = await getUserMedcienOrderDetailUseCase(
        orderId: '${orderid['orderId']}');
    response.fold((l) => Failure, (r) => userorderMedcine.addAll(r));
    bool isloading = true;
    print(userorderMedcine);
    update();
  }

  List<UserProductOrderDetail> userOrderproduct = [];
  getuserorderProduct() async {
    List<UserProductOrderDetail> refrech = [];
    userOrderproduct = refrech;
    var response = await getUserProductOrderDetailUseCase(
        orderId: '${orderid['orderId']}');
    response.fold((l) => Failure, (r) => userOrderproduct.addAll(r));
    bool isloading = true;
    print(userOrderproduct);

    update();
  }

  @override
  void refresh() {
    super.refresh();
  }

  confirmOrderDetail({required String orderDetailId}) async {
    return await confrimUserOrderDetailUSeCase(orderIdDetail: orderDetailId);
  }
   List<Rachita> rachita = [];
  getrachitImage({required String orderDetailId})async{
    rachita.clear()
;   var response= await getRachetaImageUsecase(id: orderDetailId);
   response.fold((l) => Failure, (r) => rachita.addAll(r));
   update();
                                                                 rachita.isEmpty?     Get.showSnackbar(GetSnackBar(message: 'No Image',duration: Duration(seconds: 4),)):Text('');

    Get.defaultDialog(
                                                  content:  Image.network('http://172.20.10.12/My_pharmacy/myph/public/images/${rachita[0].description}'),
                                           middleTextStyle: TextStyle(color: Colors.white),
                                                  radius: 30
                                                              );
   print(rachita);
  }
  getipaddres()async{
    try{
      var list = await NetworkInterface.list(
        includeLoopback: true,type: InternetAddressType.IPv4
      );
      for(var i=0;i<list.length;i++){
        if(list[i].name=="wlan0"){
          print(list[i].name);
          print(list[i].addresses[0].address);
        }
      }
    }catch(e){}
  }
}
