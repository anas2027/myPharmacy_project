import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/feature/product_page/domain/entity/addproduct.dart';
import 'package:pharmcy_app/feature/product_page/domain/usecase/edit_product_usecase.dart';

class EditProductController extends GetxController {
  EditproductUseCase editproductUseCase;

  EditProductController({required this.editproductUseCase});

  Map<String, String?> parameters = Get.parameters;

  Future editProduct(
      {required int price,
      required int quantity,
      required int medId,
      required String name,
      required String description,
      required String images}) async {
    AddProduct addProduct = AddProduct(
        pharmacy_id: '$medId',
        description: description,
        images: images,
        name: name,
        price: '$price',
        quantity: '$quantity');
    editproductUseCase(addProduct);
  }

  List<String> hintText = ['name', 'descrption', 'image', 'quantity', 'price'];
  List<Widget> prefixIcon = [
    const Icon(Icons.person),
    const Icon(Icons.description),
    const Icon(Icons.image),
    const Icon(Icons.list_alt_rounded),
    const Icon(Icons.price_change),
  ];
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
}
