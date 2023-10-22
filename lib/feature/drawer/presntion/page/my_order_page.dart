// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/core/colors/colors.dart';
import 'package:pharmcy_app/core/constant/constants.dart';

import '../get_x/recive_order_getx/recive_order_controller.dart';

class MyOrderpage extends StatelessWidget {
  MyColors colors = MyColors();

  ReciveOrderController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 216, 213, 213),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.offAllNamed('/homePage');
              },
              icon: Icon(
                Icons.arrow_back,
                color: colors.textcolors,
              )),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: TextDefault(
              maxLine: 1,
              colorText: colors.textcolors,
              fontWeight: FontWeight.bold,
              fontsize: 30,
              textOverflow: TextOverflow.ellipsis,
              contentText: 'MyOrdeer'),
        ),
        body: GetBuilder<ReciveOrderController>(builder: (controller) {
          if (controller.myOrder.isEmpty) {
            return RefreshIndicator(
              color: colors.textcolors,
              onRefresh: () => controller.getOrder(),
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
          } else {
            return ListView.separated(
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(18),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/myorderdescrption', parameters: {
                            'orderID': '${controller.myOrder[index].id}',
                          'warehouseId':'${controller.myOrder[index].id_warehouse}',
                            'totalprice':
                                '${controller.myOrder[index].total_price}',
                            'status': '${controller.myOrder[index].status}',
                            'statususer':
                                '${controller.myOrder[index].status_user}'
                          });
                        },
                        child: Card(
                          elevation: 30,
                          child: Container(
                            height: size.height * 0.25,
                            width: size.width * 0.9,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assests/image/pharmacy.png'),
                                        backgroundColor: Colors.teal,
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.23,
                                        child: TextDefault(
                                            maxLine: 2,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 20,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText: controller
                                                .myOrder[index].name_warehouse),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(7),
                                        child: TextDefault(
                                            maxLine: 2,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 12,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText: controller
                                                .myOrder[0].created_at),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color:
                                      const Color.fromARGB(255, 216, 213, 213),
                                  height: size.height * 0.001,
                                  width: double.infinity,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: TextDefault(
                                    maxLine: 1,
                                    colorText: colors.textcolors,
                                    fontWeight: FontWeight.bold,
                                    fontsize: 20,
                                    textOverflow: TextOverflow.ellipsis,
                                    contentText: '4 item',
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: TextDefault(
                                          maxLine: 1,
                                          colorText: colors.textcolors,
                                          fontWeight: FontWeight.bold,
                                          fontsize: 25,
                                          textOverflow: TextOverflow.ellipsis,
                                          contentText:
                                              '${controller.myOrder[index].total_price} \$',
                                        ),
                                      ),
                                    ),
                                    controller.myOrder[index].status == 0
                                        ? IconButton(
                                            onPressed: () {
                                              Get.defaultDialog(
                                                  content:
                                                      Text('Are You Shure'),
                                                  title:
                                                      "You will delete the  order",
                                                  backgroundColor: Colors.teal,
                                                  confirm: IconButton(
                                                      onPressed: () async {
                                                        if (controller
                                                                .myOrder[index]
                                                                .status_user ==
                                                            0) {
                                                          await controller
                                                              .deleteorder(
                                                                  orderID:
                                                                      '${controller.myOrder[index].id}');
                                                          await controller
                                                              .getOrder();
                                                          Get.back();
                                                        } else {
                                                          await controller
                                                              .cansleorderConfimration(
                                                            orderId:
                                                                '${controller.myOrder[index].id}',
                                                          );
                                                          await controller
                                                              .deleteorder(
                                                                  orderID:
                                                                      '${controller.myOrder[index].id}');
                                                          await controller
                                                              .getOrder();
                                                          Get.back();
                                                        }
                                                      },
                                                      icon: const Icon(
                                                          Icons.check)),
                                                  cancel: IconButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      icon: const Icon(Icons
                                                          .cancel_presentation_outlined)),
                                                  radius: 15);
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                              size: 30,
                                            ))
                                        : const Text(''),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Container(
                                        height: size.height * 0.04,
                                        width: size.width * 0.3,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 0.9,
                                            color: const Color.fromARGB(
                                                255, 216, 213, 213),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: colors.conatinerColors,
                                        ),
                                        child: Center(
                                          child: TextDefault(
                                              maxLine: 1,
                                              colorText: colors.textcolors,
                                              fontWeight: FontWeight.bold,
                                              fontsize: 20,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              contentText: controller
                                                          .myOrder[index]
                                                          .status ==
                                                      1
                                                  ? 'confirmed'
                                                  : 'waiting'),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(),
                itemCount: controller.myOrder.length);
          }
        }));
  }
}
