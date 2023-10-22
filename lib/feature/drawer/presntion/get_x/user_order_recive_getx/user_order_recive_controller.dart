import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/user_order.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/get_user_order_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserOderReciveController extends GetxController {
  GetUserOrderUseCase getUserOrderUseCase;
  UserOderReciveController({required this.getUserOrderUseCase});
  @override
  onInit() {
    super.onInit();
    getUserOrder();
  }

  bool isloading = true;
  List<UserOrder> userOrderList = [];
  Future getUserOrder() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var phid = sharedPreferences.getString('phId');
    var response = await getUserOrderUseCase(phId: '$phid');
    response.fold((l) => Failure, (r) => userOrderList.addAll(r));
    isloading = false;
    update();
  }
}
