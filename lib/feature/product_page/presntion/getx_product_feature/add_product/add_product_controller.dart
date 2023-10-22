import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/feature/product_page/domain/entity/addproduct.dart';
import 'package:pharmcy_app/feature/product_page/domain/usecase/add_product_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddProductContoller extends GetxController {
  AddproductUseCase addproductUseCase;

  AddProductContoller({required this.addproductUseCase});

  Map<String, String?> parameters = Get.parameters;

  Future addproduct(
      {required int price,
      required int quantity,
      required String name,
      required String description,
      required String images}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? phId = sharedPreferences.getString('phId');

    AddProduct addProduct = AddProduct(
        pharmacy_id: '$phId',
        description: description,
        images: images,
        name: name,
        price: '$price',
        quantity: '$quantity');
    await addproductUseCase(addProduct);
  }

// drawer
  List<String> hintText = ['name', 'descrption', 'image', 'quantity', 'price'];
  List<Widget> prefixIcon = [
    const Icon(Icons.person),
    const Icon(Icons.description),
    const Icon(Icons.image),
    const Icon(Icons.list_alt_rounded),
    const Icon(Icons.price_change),
  ];

// counter
  Timer? timer;
  int counter = 1;

  // sum counter

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
  /////////// delete medcine ///////////////
}
