// ignore_for_file: unused_local_variable, unnecessary_null_comparison, unnecessary_string_interpolations, use_key_in_widget_constructors, unnecessary_import, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pharmcy_app/feature/product_page/presntion/getx_product_feature/my_product_controller.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/constant/constants.dart';
import '../../../../core/widget/widget.dart';

// ignore: must_be_immutable
class MyProductPage extends StatelessWidget {
  late MyColors colors = MyColors();
  MyProductController controller = Get.find();
  TextEditingController newquanityt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              iconSize: 30,
              onTap: controller.changePage,
              elevation: 3,
              currentIndex: controller.currentIndex.value,
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  label: 'medcinde',
                  icon: Icon(
                    Icons.medication_rounded,
                    color: colors.textcolors,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'home',
                  icon: Icon(
                    Icons.home,
                    color: colors.textcolors,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'product',
                  icon: Icon(
                    Icons.medication_liquid_rounded,
                    color: colors.textcolors,
                  ),
                )
              ]),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: colors.textcolors),
          title: Center(
              child: FutureBuilder(
            future: controller.getphName(),
            builder: (context, snapshot) => Text(
              "${snapshot.data}",
              style: TextStyle(color: colors.textcolors),
            ),
          )),
          actions: [
            IconButton(
                onPressed: () {
                  Get.offAndToNamed('/AddProduct');
                },
                icon: Icon(
                  Icons.add,
                  color: colors.textcolors,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  final result = showSearch(
                      context: context,
                      delegate: ProductSearch(
                          product: controller.productlist,
                          controller: controller,
                          size: size));
                },
                icon: Icon(
                  Icons.search,
                  color: colors.textcolors,
                  size: 30,
                ))
          ],
        ),
        body: GetBuilder<MyProductController>(
          builder: (controller) {
            if (controller.productlist.isNotEmpty) {
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                contentText: '${controller
                                                    .productlist[index].name}',
                                                maxLine: 1,
                                                colorText: colors.textcolors,
                                                fontsize: 28,
                                                fontWeight: FontWeight.bold,
                                                textOverflow: TextOverflow.fade,
                                              ),
                                              TextDefault(
                                                contentText:
                                                    ' ${controller.productlist[index].description}',
                                                maxLine: 2,
                                                colorText: colors.textcolors,
                                                fontsize: 28,
                                                fontWeight: FontWeight.bold,
                                                textOverflow: TextOverflow.fade,
                                              ),
                                              TextDefault(
                                                contentText:
                                                    'quantity: ${controller.productlist[index].quantity}',
                                                maxLine: 2,
                                                colorText: colors.textcolors,
                                                fontsize: 25,
                                                fontWeight: FontWeight.bold,
                                                textOverflow: TextOverflow.fade,
                                              ),
                                              TextDefault(
                                                contentText:
                                                    'price: ${controller.productlist[index].price} \$',
                                                maxLine: 2,
                                                colorText: colors.textcolors,
                                                fontsize: 25,
                                                fontWeight: FontWeight.bold,
                                                textOverflow: TextOverflow.fade,
                                              ),
                                              newMethod(
                                                  size, controller, index),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(),
                                          child: SizedBox(
                                            width: 130,
                                            height: 100,
                                            child: Image(
                                              image: NetworkImage(controller
                                                  .productlist[index].images),
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
                            itemCount: controller.productlist.length),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return RefreshIndicator(
                color: colors.textcolors,
                onRefresh: () => controller.getProduct(),
                child: ListView(
                  children: [
                    Center(
                      child: controller.isloading
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 350),
                                child: CircularProgressIndicator(
                                  color: colors.textcolors,
                                ),
                              ),
                            )
                          : TextDefault(
                              maxLine: 30,
                              colorText: colors.textcolors,
                              fontWeight: FontWeight.bold,
                              fontsize: 30,
                              textOverflow: TextOverflow.ellipsis,
                              contentText:
                                  '\n\n\n\n\n\n\n\n\n\n there is no medcine now swip down to refrech :('),
                    ),
                  ],
                ),
              );
            }
          },
        ));
  }

  Row newMethod(Size size, MyProductController controller, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
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
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
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
                Icons.minimize_rounded,
                size: 40,
              ),
              color: const Color.fromARGB(255, 62, 211, 139)),
        ),
        IconButton(
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
              size: 30,
            )),
        IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: 'Do you want to delete the med for sure',
                confirm: IconButton(
                    icon: Icon(
                      Icons.check,
                      color: colors.appbar,
                    ),
                    onPressed: () {
                      controller.deleteMedcine(
                          idMed: controller.productlist[index].id);

                      Get.offAllNamed('/MyProduct');
                    }),
                cancel: IconButton(
                    onPressed: () {
                      Get.off('/MyProduct');
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
      ],
    );
  }
}
