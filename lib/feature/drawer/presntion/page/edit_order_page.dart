// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/core/constant/constants.dart';

import '../../../../core/colors/colors.dart';
import '../../../home_page/presention/get_x/warehouse_medcine/warehouse_medcine_contoller.dart';

// ignore: must_be_immutable
class AddNewMedcineToCart extends StatelessWidget {
  MyColors colors = MyColors();
  var idware = Get.parameters;
  WarehouseMedcineController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String namewarehouse = '${idware['namewarehous']}';
    String orderId = '${idware['orderId']}';
    String status = '${idware['status']}';
    String totalprice = '${idware['totalprice']}';
    String warehoused ='${idware['idware']}';
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offAndToNamed('/myorderdescrption', parameters: {
                "orderID": orderId,
                "status": status,
                "totalprice": totalprice
              });
              controller.cansleorderConfimration(orderId: orderId);
            },
            icon: const Icon(Icons.arrow_back)),
        title: TextDefault(
            maxLine: 1,
            colorText: colors.textcolors,
            fontWeight: FontWeight.bold,
            fontsize: 30,
            textOverflow: TextOverflow.ellipsis,
            contentText: namewarehouse),
      ),
      body: GetBuilder<WarehouseMedcineController>(builder: (controller) {
        if (controller.medcine.isNotEmpty) {
          return RefreshIndicator(
              onRefresh: () async {
                controller.getMedcine();
                controller.currentindex = 1000000000;
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.getmedbycategory(
                                        warehouseID: '1',
                                        nameCate: controller
                                            .category[index].name_category);
                                    controller.changecurrentindex(index: index);
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.all(5),
                                    width: 80,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: controller.currentindex == index
                                            ? Colors.white70
                                            : Colors.white54,
                                        borderRadius:
                                            controller.currentindex == index
                                                ? BorderRadius.circular(15)
                                                : BorderRadius.circular(10),
                                        border: controller.currentindex == index
                                            ? Border.all(
                                                color: colors.textcolors,
                                                width: 4)
                                            : null),
                                    child: Center(
                                        child: TextDefault(
                                            maxLine: 1,
                                            colorText:
                                                controller.currentindex == index
                                                    ? colors.textcolors
                                                    : colors.appbar,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 15,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText: controller
                                                .category[index]
                                                .name_category)),
                                  ),
                                ),
                                Visibility(
                                    visible: controller.currentindex == index,
                                    child: Container(
                                      height: 5,
                                      width: 5,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: colors.textcolors),
                                    ))
                              ],
                            );
                          },
                          itemCount: controller.category.length),
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  Get.toNamed('/AddMedcineToCart', parameters: {
                                    'id': '${idware['id']}',
                                    'orderId': '${idware['orderId']}',
                                    'medId': '${controller.medcine[index].id}',
                                    'medPrice':
                                        '${controller.medcine[index].pharmcyPrice}',
                                    'MedName': controller.medcine[index].name,
                                    'idware': '${idware['idware']}',
                                    'status':
                                        '${controller.medcine[index].status}',
                                    'mg': '${controller.medcine[index].mg}',
                                    'description':
                                        controller.medcine[index].description,
                                    'imageUrl':
                                        controller.medcine[index].imageUrl,
                                    'route': 'edit',
                                    'namewarehouse': namewarehouse,
                                    'statuss': status,
                                    'totalprice': "${idware['totalprice']}",
                                  });
                                },
                                child: newMethod(size, controller, index));
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          itemCount: controller.medcine.length),
                    ),
                  ],
                ),
              ));
        } else if (controller.medcine.isEmpty) {
          return RefreshIndicator(
            color: colors.textcolors,
            onRefresh: () => controller.getMedcine(),
            child: ListView(
              children: [
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.getmedbycategory(
                                    warehouseID: '1',
                                    nameCate: controller
                                        .category[index].name_category);
                                controller.changecurrentindex(index: index);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.all(5),
                                width: 80,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: controller.currentindex == index
                                        ? Colors.white70
                                        : Colors.white54,
                                    borderRadius:
                                        controller.currentindex == index
                                            ? BorderRadius.circular(15)
                                            : BorderRadius.circular(10),
                                    border: controller.currentindex == index
                                        ? Border.all(
                                            color: colors.textcolors, width: 4)
                                        : null),
                                child: Center(
                                    child: TextDefault(
                                        maxLine: 1,
                                        colorText:
                                            controller.currentindex == index
                                                ? colors.textcolors
                                                : colors.appbar,
                                        fontWeight: FontWeight.bold,
                                        fontsize: 15,
                                        textOverflow: TextOverflow.ellipsis,
                                        contentText: controller
                                            .category[index].name_category)),
                              ),
                            ),
                            Visibility(
                                visible: controller.currentindex == index,
                                child: Container(
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: colors.textcolors),
                                ))
                          ],
                        );
                      },
                      itemCount: controller.category.length),
                ),
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
          return Center(
              child: CircularProgressIndicator(
            color: colors.textcolors,
          ));
        }
      }),
    );
  }

  Container newMethod(
      Size size, WarehouseMedcineController controller, int index) {
    return Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colors.conatinerColors,
        ),
        // color: Color.fromARGB(135, 100, 255, 219)),
        height: size.height * 0.3,
        width: size.width * 0.8,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextDefault(
                      contentText: controller.medcine[index].name,
                      maxLine: 2,
                      colorText: colors.textcolors,
                      fontsize: 30,
                      fontWeight: FontWeight.bold,
                      textOverflow: TextOverflow.fade,
                    ),
                    Container(
                      height: size.height * 0.006,
                      width: size.width * 0.4,
                      color: Colors.white,
                    ),
                    TextDefault(
                      contentText: 'mg: ${controller.medcine[index].mg}',
                      maxLine: 2,
                      colorText: colors.textcolors,
                      fontsize: 25,
                      fontWeight: FontWeight.bold,
                      textOverflow: TextOverflow.fade,
                    ),
                    TextDefault(
                      contentText: 'exp: ${controller.medcine[index].exp}',
                      maxLine: 2,
                      colorText: colors.textcolors,
                      fontsize: 25,
                      fontWeight: FontWeight.bold,
                      textOverflow: TextOverflow.fade,
                    ),
                    TextDefault(
                      contentText:
                          'qantity: ${controller.medcine[index].quantity}',
                      maxLine: 2,
                      colorText: colors.textcolors,
                      fontsize: 25,
                      fontWeight: FontWeight.bold,
                      textOverflow: TextOverflow.fade,
                    ),
                    TextDefault(
                      contentText: controller.medcine[index].status == 0
                          ? ' dont need a Rezpit'
                          : 'need A Rezpit',
                      maxLine: 2,
                      colorText: colors.textcolors,
                      fontsize: 25,
                      fontWeight: FontWeight.bold,
                      textOverflow: TextOverflow.fade,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 90),
                child: Image(
                  image: NetworkImage(controller.medcine[index].imageUrl),
                  height: size.height * 0.40,
                  width: size.width * 0.35,
                ),
              ),
            ],
          ),
        ));
  }
}
