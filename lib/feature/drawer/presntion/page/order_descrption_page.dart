// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/core/constant/constants.dart';
import 'package:pharmcy_app/feature/drawer/presntion/get_x/recive_descrption_order_getx/controller_descrption_order.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/warehouse.dart';

import '../../../../core/colors/colors.dart';

class MyOrderDescrptionpage extends StatelessWidget {
  MyColors colors = MyColors();
  OrderDescrptioncontroller controller = Get.find();
  var id = Get.parameters;
  String orderID = '';
  String totalprice = '';
  String status = '';
  @override
  Widget build(BuildContext context) {
    orderID = '${id['orderID']}';
    totalprice = '${id['totalprice']}';
    status = '${id['status']}';
    String  WarehouseId='${id['warehouseId']}';
    String statususer = '${id['statususer']}';
    print(WarehouseId);
    
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 216, 213, 213),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.offAllNamed('/myorder');
              },
              icon: const Icon(Icons.arrow_back)),
          centerTitle: true,
          title: TextDefault(
              maxLine: 1,
              colorText: colors.textcolors,
              fontWeight: FontWeight.bold,
              fontsize: 30,
              textOverflow: TextOverflow.ellipsis,
              contentText: 'myOrder '),
        ),
        body: GetBuilder<OrderDescrptioncontroller>(builder: (controller) {
          if (controller.myorderDescrption.isEmpty) {
            return RefreshIndicator(
              color: colors.textcolors,
              onRefresh: () =>
                  controller.getOrderDescrption(orderId: '${id['orderId']}'),
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
                                '\n\n\n\n\n\n\n\n\n\n there is no medcine on this order :('),
                  ),
                ],
              ),
            );
          } else {
            return RefreshIndicator(
              color: colors.textcolors,
              onRefresh: () =>
                  controller.getOrderDescrption(orderId: '${id['orderID']}'),
              child: ListView.separated(
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(18),
                        child: Card(
                          elevation: 30,
                          child: Container(
                            height: size.height * 0.62,
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
                                      Expanded(
                                        child: SizedBox(
                                          width: size.width * 0.23,
                                          child: TextDefault(
                                              maxLine: 2,
                                              colorText: colors.textcolors,
                                              fontWeight: FontWeight.bold,
                                              fontsize: 30,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              contentText: controller
                                                  .myorderDescrption[index]
                                                  .name_warehouse),
                                        ),
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
                                                .myorderDescrption[index].exp),
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
                                          contentText: '41000 \$',
                                        ),
                                      ),
                                    ),
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
                                              contentText:
                                                  int.parse(status) == 1
                                                      ? 'confirmed'
                                                      : 'waiting'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 25,
                                  width: double.infinity,
                                  color:
                                      const Color.fromARGB(255, 216, 213, 213),
                                  child: TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 20,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText: 'YourOrder'),
                                ),
                                SizedBox(
                                  height: size.height * 0.2,
                                  child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    TextDefault(
                                                        maxLine: 1,
                                                        colorText:
                                                            colors.textcolors,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontsize: 20,
                                                        textOverflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                        contentText:
                                                            '${controller.myorderDescrption[index].quantity}'),
                                                    SizedBox(
                                                      width: size.width * 0.01,
                                                    ),
                                                    TextDefault(
                                                        maxLine: 1,
                                                        colorText:
                                                            colors.textcolors,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontsize: 20,
                                                        textOverflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                        contentText: controller
                                                            .myorderDescrption[
                                                                index]
                                                            .name_med),
                                                  ],
                                                ),
                                              ),
                                              int.parse(status) == 0
                                                  ? IconButton(
                                                      onPressed: () async {
                                                        await controller
                                                            .cansleorderConfimration(
                                                                orderId:
                                                                    orderID);
                                                        controller
                                                            .deleteOrderDetailmethod(
                                                                orderDetailId:
                                                                    '${controller.myorderDescrption[index].id}');
                                                        await controller
                                                            .cansleorderConfimration(
                                                                orderId:
                                                                    orderID);
                                                        controller
                                                            .getOrderDescrption(
                                                                orderId:
                                                                    orderID);
                                                      },
                                                      icon: const Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                        size: 40,
                                                      ))
                                                  : const Text(''),
                                              TextDefault(
                                                  maxLine: 1,
                                                  colorText: colors.textcolors,
                                                  fontWeight: FontWeight.bold,
                                                  fontsize: 20,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  contentText:
                                                      '${controller.myorderDescrption[index].price_pharmacy} \$'),
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const Divider(
                                          height: 5,
                                          thickness: 1,
                                          color: Color.fromARGB(
                                              255, 216, 213, 213),
                                        );
                                      },
                                      itemCount:
                                          controller.myorderDescrption.length),
                                ),
                                int.parse(status) == 0
                                    ? Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                                onPressed: () async {
                                                  if (int.parse(statususer) ==
                                                      1) {
                                                    await controller
                                                        .cansleorderConfimration(
                                                            orderId: orderID);
                                                    Get.toNamed(
                                                        '/addnewmedtoyourcart',
                                                        parameters: {
                                                          'id': '1',
                                                          'orderId': orderID,
                                                          'idware': WarehouseId,
                                                          'namewarehous': controller
                                                              .myorderDescrption[
                                                                  index]
                                                              .name_warehouse,
                                                          'status': status,
                                                          'totalprice':
                                                              totalprice
                                                        });
                                                  } else {
                                                    Get.toNamed(
                                                        '/addnewmedtoyourcart',
                                                        parameters: {
                                                          'id': '1',
                                                          'orderId': orderID,
                                                          'idware': WarehouseId,
                                                          'namewarehous': controller
                                                              .myorderDescrption[
                                                                  index]
                                                              .name_warehouse,
                                                          'status': status,
                                                          'totalprice':
                                                              totalprice
                                                        });
                                                  }
                                                },
                                                icon: const Icon(
                                                  Icons.edit,
                                                  color: Color.fromARGB(
                                                      255, 216, 213, 213),
                                                  size: 40,
                                                ))
                                          ],
                                        ),
                                      )
                                    : const Text(''),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 20,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText:
                                          'Total Pricec:                           $totalprice \$'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 30),
                  itemCount: 1),
            );
          }
        }));
  }
}
