// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/core/constant/constants.dart';
import 'package:pharmcy_app/feature/home_page/presention/get_x/home_page/home_page_controller.dart';
import 'package:pharmcy_app/feature/product_page/presntion/getx_product_feature/my_product_controller.dart';

import '../../feature/product_page/domain/entity/product.dart';
import '../colors/colors.dart';

class Programdrawer extends StatelessWidget {
  const Programdrawer({
    super.key,
    required this.size,
    required this.colors,
    required this.controller,
  });

  final Size size;
  final MyColors colors;
  final HomePageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.5,
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: size.width * 0.5,
          child: ListView.separated(
              itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    if (index == 1) {
                      Get.toNamed('/userorder');
                    } else if (index == 5) {
                      Get.toNamed('/Wallet');
                    } else if (index == 4) {
                    } else if (index == 2) {
                      Get.offAllNamed('/myorder');
                    } else if (index == 3) {
                      Get.toNamed('/DashBoard');
                    }
                    else if(index == 6){
                      Get.offAllNamed('/');
                    }
                  },
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(draweImageAvatar[index])),
                  title: index == 0
                      ? FutureBuilder(
                          future: controller.getphName(),
                          builder: (context, snapshot) => Text(
                            "${snapshot.data}",
                            style: TextStyle(color: colors.textcolors),
                          ),
                        )
                      : Text(
                          '${drawer[index]}',
                          style: TextStyle(color: colors.textcolors),
                        )),
              separatorBuilder: (context, index) => Divider(
                    color: colors.textcolors,
                    thickness: 2,
                    height: 25,
                  ),
              itemCount: 7),
        ),
      ),
    );
  }
}

class ProductSearch extends SearchDelegate<String> {
  TextEditingController newquanityt = TextEditingController();
  List<Product> product;
  Size size;
  MyProductController controller;
  ProductSearch(
      {required this.controller, required this.size, required this.product});
  late MyColors colors = MyColors();

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, '');
            } else {
              query = '';
            }
          },
          icon: Icon(
            Icons.clear,
            color: colors.textcolors,
            size: 30,
          ),
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != null) {
      final result = product
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return RefreshIndicator(
        onRefresh: () {
          return controller.getProduct();
        },
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE

            //<-- SEE HERE
            side: const BorderSide(
              width: 3,
              color: Color.fromARGB(255, 213, 219, 216),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => Card(
                          elevation: 2,
                          child: Container(
                            padding: const EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colors.conatinerColors,
                            ),
                            // color: Color.fromARGB(135, 100, 255, 219)),
                            height: size.height * 0.40,
                            width: size.width * 0.8,

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width * 0.5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextDefault(
                                        contentText:
                                            controller.productlist[index].name,
                                        maxLine: 2,
                                        colorText: colors.textcolors,
                                        fontsize: 28,
                                        fontWeight: FontWeight.bold,
                                        textOverflow: TextOverflow.fade,
                                      ),
                                      TextDefault(
                                        contentText:
                                            ' ${result[index].description}',
                                        maxLine: 2,
                                        colorText: colors.textcolors,
                                        fontsize: 28,
                                        fontWeight: FontWeight.bold,
                                        textOverflow: TextOverflow.fade,
                                      ),
                                      TextDefault(
                                        contentText:
                                            'quantity: ${result[index].quantity}',
                                        maxLine: 2,
                                        colorText: colors.textcolors,
                                        fontsize: 25,
                                        fontWeight: FontWeight.bold,
                                        textOverflow: TextOverflow.fade,
                                      ),
                                      TextDefault(
                                        contentText:
                                            'price: ${result[index].price} \$',
                                        maxLine: 2,
                                        colorText: colors.textcolors,
                                        fontsize: 25,
                                        fontWeight: FontWeight.bold,
                                        textOverflow: TextOverflow.fade,
                                      ),
                                      newMethod(size, controller, index),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(),
                                  child: SizedBox(
                                    width: 130,
                                    height: 100,
                                    child: Image(
                                      image: NetworkImage(result[index].images),
                                      height: size.height * 0.20,
                                      width: size.width * 0.10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => Container(
                          height: 10,
                          color: Colors.white,
                        ),
                    itemCount: result.length),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Text('no medcine');
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query != null) {
      final result = product
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return RefreshIndicator(
        onRefresh: () {
          return controller.getProduct();
        },
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE

            //<-- SEE HERE
            side: const BorderSide(
              width: 3,
              color: Color.fromARGB(255, 213, 219, 216),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => Card(
                          elevation: 2,
                          child: Container(
                            padding: const EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colors.conatinerColors,
                            ),
                            // color: Color.fromARGB(135, 100, 255, 219)),
                            height: size.height * 0.40,
                            width: size.width * 0.8,

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width * 0.5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextDefault(
                                        contentText: result[index].name,
                                        maxLine: 2,
                                        colorText: colors.textcolors,
                                        fontsize: 28,
                                        fontWeight: FontWeight.bold,
                                        textOverflow: TextOverflow.fade,
                                      ),
                                      TextDefault(
                                        contentText:
                                            ' ${result[index].description}',
                                        maxLine: 2,
                                        colorText: colors.textcolors,
                                        fontsize: 28,
                                        fontWeight: FontWeight.bold,
                                        textOverflow: TextOverflow.fade,
                                      ),
                                      TextDefault(
                                        contentText:
                                            'quantity: ${result[index].quantity}',
                                        maxLine: 2,
                                        colorText: colors.textcolors,
                                        fontsize: 25,
                                        fontWeight: FontWeight.bold,
                                        textOverflow: TextOverflow.fade,
                                      ),
                                      TextDefault(
                                        contentText:
                                            'price: ${result[index].price} \$',
                                        maxLine: 2,
                                        colorText: colors.textcolors,
                                        fontsize: 25,
                                        fontWeight: FontWeight.bold,
                                        textOverflow: TextOverflow.fade,
                                      ),
                                      newMethod(size, controller, index),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(),
                                  child: SizedBox(
                                    width: 130,
                                    height: 100,
                                    child: Image(
                                      image: NetworkImage(result[index].images),
                                      height: size.height * 0.20,
                                      width: size.width * 0.10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => Container(
                          height: 10,
                          color: Colors.white,
                        ),
                    itemCount: result.length),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Text('no medcine');
    }
  }

  Row newMethod(Size size, MyProductController controller, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 1),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(255, 217, 214, 214),
                )),
            child: IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    content: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: newquanityt,
                    ),
                    title:
                        'add new amount for your peoduct this amount will add',
                    confirm: IconButton(
                        icon: Icon(
                          Icons.check,
                          color: colors.appbar,
                        ),
                        onPressed: () async {
                          Get.back();

                          controller.addnewQunatity(
                              idMed: '${controller.productlist[index].id}',
                              newQuantity: '${newquanityt.text.toString()}');
                          controller.getProduct();
                        }),
                    cancel: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.cancel,
                          color: colors.appbar,
                        )),
                  );
                },
                icon: const Icon(
                  Icons.add,
                  size: 40,
                ),
                color: const Color.fromARGB(255, 62, 211, 139)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 1),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(255, 217, 214, 214),
                )),
            child: IconButton(
                onPressed: () {
                  Get.offAndToNamed('/EditProductpage',
                      arguments: '${controller.productlist[index].id}',
                      parameters: {
                        'id': '${controller.productlist[index].id}',
                        'name': controller.productlist[index].name,
                        'descrption': controller.productlist[index].description,
                        'image': controller.productlist[index].images,
                        'price': '${controller.productlist[index].price}',
                        'quantity': '${controller.productlist[index].quantity}'
                      });
                },
                icon: const Icon(
                  Icons.edit,
                  color: Color.fromARGB(177, 121, 128, 121),
                  size: 40,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 2),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(255, 217, 214, 214),
                )),
            child: IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Do you want to delete this med for sure',
                    confirm: IconButton(
                        icon: Icon(
                          Icons.check,
                          color: colors.appbar,
                        ),
                        onPressed: () {
                          controller.deleteMedcine(
                              idMed: controller.productlist[index].id);

                          Get.back();
                        }),
                    cancel: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.cancel,
                          color: colors.appbar,
                        )),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 40,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 1),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(255, 217, 214, 214),
                )),
            child: IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    content: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: newquanityt,
                    ),
                    title:
                        'add new amount for your peoduct this amount will add',
                    confirm: IconButton(
                        icon: Icon(
                          Icons.check,
                          color: colors.appbar,
                        ),
                        onPressed: () {
                          controller.DelteNewQuantity(
                              idMed: '${controller.productlist[index].id}',
                              newQuantity: '${newquanityt.text.toString()}');
                          controller.getProduct();
                          Get.back();
                        }),
                    cancel: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.cancel,
                          color: colors.appbar,
                        )),
                  );
                },
                icon: const Icon(
                  Icons.minimize,
                  size: 40,
                ),
                color: const Color.fromARGB(255, 62, 211, 139)),
          ),
        ),
      ],
    );
  }
}
