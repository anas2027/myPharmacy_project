// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/add_medcine_to_order_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMedcineToCartController extends GetxController {
  AddMedcineToOrderUseCase addMedcineToOrderUseCase;
  AddMedcineToCartController(
      {required this.addMedcineToOrderUseCase, required this.image});
  File image;
  final imagepicker = ImagePicker();
  bool imageloaded = false;
  UploadIage() async {
    var pickedimage = await imagepicker.pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      image = File(pickedimage.path);
      update();

      imageloaded = true;
    } else {
      update();

      imageloaded = false;
    }
  }

  Future<String?> getPhName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var phId = sharedPreferences.getString('phId');
    return phId;
  }

  // counter
  Timer? timer;
  int counter = 1;
  @override
  onInit() {
    super.onInit();
    int counter = 1;
  }

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

  AddMedcineToCart(String medcineId, String orderid, String quqntity) async {
    addMedcineToOrderUseCase(
        medcineId: medcineId, orderid: orderid, quqntity: quqntity);
  }
}
