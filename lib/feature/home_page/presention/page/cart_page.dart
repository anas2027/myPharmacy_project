// ignore_for_file: must_be_immutable, camel_case_types, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pharmcy_app/core/constant/constants.dart';
import 'package:pharmcy_app/feature/home_page/presention/get_x/cart_getx/cart_controller.dart';

import '../../../../core/colors/colors.dart';

// ignore: use_key_in_widget_constructors
class CartPage extends StatelessWidget {
  late MyColors colors = MyColors();
  CartController controller = Get.find();
  var data = Get.parameters;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart ',
          style: TextStyle(color: colors.textcolors),
        ),
      ),
      body: GetBuilder<CartController>(builder: (controller) {
        if (controller.myCart.isEmpty) {
          return RefreshIndicator(
            color: colors.textcolors,
            onRefresh: () =>
                controller.getcartMedcine(orderId: '${data['orderId']}'),
            child: ListView(
              children: [
                Center(
                  child: controller.isloadingcart
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
        } else if (controller.myCart.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: () {
              return controller.getcartMedcine(orderId: '${data['orderId']}');
            },
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return index == controller.myCart.length
                      ? buttomconriem(
                          size: size,
                          colors: colors,
                          controller: controller,
                          orderId: '${data['orderId']}',
                        )
                      : Container(
                          height: size.height * 0.2,
                          width: double.infinity,
                          color: const Color.fromARGB(255, 216, 213, 213),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width * 0.3,
                                  height: size.height * 0.3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 40, top: 40),
                                    child: Image(
                                        image: NetworkImage(
                                            controller.myCart[index].image)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextDefault(
                                          maxLine: 1,
                                          colorText: colors.textcolors,
                                          fontWeight: FontWeight.bold,
                                          fontsize: 25,
                                          textOverflow: TextOverflow.ellipsis,
                                          contentText: 'parcetmol'),
                                      TextDefault(
                                          maxLine: 1,
                                          colorText: colors.textcolors,
                                          fontWeight: FontWeight.bold,
                                          fontsize: 25,
                                          textOverflow: TextOverflow.ellipsis,
                                          contentText:
                                              'quantity: ${controller.myCart[index].quantity}'),
                                      TextDefault(
                                          maxLine: 1,
                                          colorText: colors.textcolors,
                                          fontWeight: FontWeight.bold,
                                          fontsize: 25,
                                          textOverflow: TextOverflow.ellipsis,
                                          contentText:
                                              'ph price: ${controller.myCart[index].price_customer}'),
                                      TextDefault(
                                          maxLine: 1,
                                          colorText: colors.textcolors,
                                          fontWeight: FontWeight.bold,
                                          fontsize: 25,
                                          textOverflow: TextOverflow.ellipsis,
                                          contentText:
                                              ' price: ${controller.myCart[index].price_customer}'),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 90, left: 40),
                                  child: Card(
                                    elevation: 1,
                                    shadowColor: Colors.grey,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              controller.deleteOrderDetailmethod(
                                                  orderDetailId:
                                                      '${controller.myCart[index].id}');
                                              controller.getcartMedcine(
                                                  orderId:
                                                      '${data['orderId']}');
                                              controller.getTotalPrice(
                                                  orderId:
                                                      '${data['orderId']}');
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: size.height * 0.005,
                    color: Colors.white,
                    width: double.infinity,
                  );
                },
                itemCount: controller.myCart.length + 1),
          );
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }
}

class buttomconriem extends StatelessWidget {
  buttomconriem({
    super.key,
    required this.size,
    required this.colors,
    required this.controller,
    required this.orderId,
  });
  final CartController controller;
  final Size size;
  final MyColors colors;
  final String orderId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: TextDefault(
                    maxLine: 1,
                    colorText: colors.textcolors,
                    fontWeight: FontWeight.bold,
                    fontsize: 30,
                    textOverflow: TextOverflow.ellipsis,
                    contentText: 'Total'),
              ),
              TextDefault(
                  maxLine: 1,
                  colorText: colors.textcolors,
                  fontWeight: FontWeight.bold,
                  fontsize: 30,
                  textOverflow: TextOverflow.ellipsis,
                  contentText: '${controller.TotalPrice} \$')
            ],
          ),
          SizedBox(
            height: size.height * 0.3,
          ),
          SizedBox(
            width: size.width * 0.9,
            height: size.height * 0.06,
            child: MaterialButton(
              onPressed: () {
                controller.cartConfirmUsecase(orderId: orderId);
              },
              color: colors.appbar,
              child: TextDefault(
                  colorText: colors.textcolors,
                  contentText: 'confirm',
                  fontWeight: FontWeight.bold,
                  fontsize: 30,
                  maxLine: 1,
                  textOverflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}
