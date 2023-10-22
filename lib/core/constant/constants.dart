// ignore_for_file: body_might_complete_normally_nullable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:pharmcy_app/feature/home_page/domain/entity/warehouse_medcine.dart';
import 'package:pharmcy_app/feature/home_page/presention/get_x/warehouse_medcine/warehouse_medcine_contoller.dart';

import '../colors/colors.dart';

List drawer = [
  'Anas Warehouse',
  'ReciveOrder',
  'sendOrder',
  'DashBoard',
  'Contactus',
  'Wallet',
  'LogOut',
];
List<String> draweImageAvatar = [
  'assests/image/gamer.png',
  'assests/image/reciveorder.png',
  'assests/image/sendorder.png',
  'assests/image/dashboard.png',
  'assests/image/headphone.png',
  'assests/image/wallet.png',
  'assests/image/logout.png',
];

// ignore: must_be_immutable
class TextDefault extends StatelessWidget {
  TextDefault(
      {super.key,
      required this.maxLine,
      required this.colorText,
      required this.fontWeight,
      required this.fontsize,
      required this.textOverflow,
      required this.contentText});
  Color colorText;
  String contentText;
  double? fontsize;
  FontWeight? fontWeight;
  TextOverflow? textOverflow;
  int maxLine;
  @override
  Widget build(BuildContext context) {
    return Text(
      contentText,
      overflow: textOverflow,
      maxLines: maxLine,
      style: TextStyle(
        color: colorText,
        fontSize: fontsize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class MedcineSearch extends SearchDelegate<String> {
  List<WarehouseMedcine> med;
  Size size;
  WarehouseMedcineController homePageController;
  String orderId;
  String idwarehouse;
  MedcineSearch({
    required this.idwarehouse,
    required this.orderId,
    required this.homePageController,
    required this.size,
    required this.med,
  });
  late MyColors colors = MyColors();
  String image =
      'https://akm-img-a-in.tosshub.com/businesstoday/images/story/202210/64e01bf1f7dbd9099e249e9c3247fdbb9a46b4b1-1280x720-sixteen_nine.jpg';

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
      final result = med
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return Scaffold(
          backgroundColor: Color.fromARGB(252, 242, 239, 239),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [],
            body: GetBuilder<WarehouseMedcineController>(builder: (controller) {
              if (controller.medcine.isNotEmpty) {
                return SingleChildScrollView(
                  child: RefreshIndicator(
                      onRefresh: () async {
                        controller.getMedcine();
                        controller.currentindex = 1000000000;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                          height: size.height * 0.6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      width: double.infinity,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    await controller
                                                        .getmedbycategory(
                                                            warehouseID: '1',
                                                            nameCate: controller
                                                                .category[index]
                                                                .name_category);

                                                    controller
                                                        .changecurrentindex(
                                                            index: index);
                                                  },
                                                  child: AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                    margin:
                                                        const EdgeInsets.all(5),
                                                    width: 80,
                                                    height: 45,
                                                    decoration: BoxDecoration(
                                                        color: controller
                                                                    .currentindex ==
                                                                index
                                                            ? Colors.white70
                                                            : Colors.white54,
                                                        borderRadius: controller
                                                                    .currentindex ==
                                                                index
                                                            ? BorderRadius
                                                                .circular(15)
                                                            : BorderRadius
                                                                .circular(10),
                                                        border: controller
                                                                    .currentindex ==
                                                                index
                                                            ? Border.all(
                                                                color: colors
                                                                    .textcolors,
                                                                width: 4)
                                                            : null),
                                                    child: Center(
                                                        child: TextDefault(
                                                            maxLine: 1,
                                                            colorText: controller
                                                                        .currentindex ==
                                                                    index
                                                                ? colors
                                                                    .textcolors
                                                                : colors.appbar,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontsize: 15,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            contentText: controller
                                                                .category[index]
                                                                .name_category)),
                                                  ),
                                                ),
                                                Visibility(
                                                    visible: controller
                                                            .currentindex ==
                                                        index,
                                                    child: Container(
                                                      height: 5,
                                                      width: 5,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: colors
                                                              .textcolors),
                                                    ))
                                              ],
                                            );
                                          },
                                          itemCount:
                                              controller.category.length),
                                    ),
                                    Expanded(
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(
                                                      '/AddMedcineToCart',
                                                      parameters: {
                                                        'id':
                                                            '${result[index].id}',
                                                        'orderId':
                                                            '${controller.orderId}',
                                                        'medId':
                                                            '${result[index].id}',
                                                        'medPrice':
                                                            '${result[index].pharmcyPrice}',
                                                        'MedName':
                                                            result[index].name,
                                                        'status':
                                                            '${result[index].status}',
                                                        'mg':
                                                            '${result[index].mg}',
                                                        'description':
                                                            result[index]
                                                                .description,
                                                        'imageUrl':
                                                            result[index]
                                                                .imageUrl,
                                                        'customerprice':
                                                            '${controller.medcine[index].price_customer}',
                                                      });
                                                },
                                                child: newMethod(
                                                    size, controller, index));
                                          },
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                                width: size.width * 0.1,
                                              ),
                                          itemCount: result.length),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.1,
                              ),
                              Container(
                                height: size.height * 0.05,
                                width: size.width * 0.8,
                                color: colors.textcolors,
                                child: MaterialButton(
                                  onPressed: () {
                                    controller.createOrder();
                                  },
                                  child: TextDefault(
                                      maxLine: 1,
                                      colorText: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 30,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText: 'CreateOrder'),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                );
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
                                          warehouseID:
                                              '${controller.warehouses[0].id}',
                                          nameCate: controller
                                              .category[index].name_category);
                                      controller.changecurrentindex(
                                          index: index);
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      margin: const EdgeInsets.all(5),
                                      width: 80,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color:
                                              controller.currentindex == index
                                                  ? Colors.white70
                                                  : Colors.white54,
                                          borderRadius:
                                              controller.currentindex == index
                                                  ? BorderRadius.circular(15)
                                                  : BorderRadius.circular(10),
                                          border: controller.currentindex ==
                                                  index
                                              ? Border.all(
                                                  color: colors.textcolors,
                                                  width: 4)
                                              : null),
                                      child: Center(
                                          child: TextDefault(
                                              maxLine: 1,
                                              colorText:
                                                  controller.currentindex ==
                                                          index
                                                      ? colors.textcolors
                                                      : colors.appbar,
                                              fontWeight: FontWeight.bold,
                                              fontsize: 15,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
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
          ));
    } else {
      return const Text('no medcine');
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query != null) {
      final result = med
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return Scaffold(
          backgroundColor: Color.fromARGB(252, 242, 239, 239),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [],
            body: GetBuilder<WarehouseMedcineController>(builder: (controller) {
              if (controller.medcine.isNotEmpty) {
                return SingleChildScrollView(
                  child: RefreshIndicator(
                      onRefresh: () async {
                        controller.getMedcine();
                        controller.currentindex = 1000000000;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                          height: size.height * 0.6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      width: double.infinity,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    await controller
                                                        .getmedbycategory(
                                                            warehouseID: '1',
                                                            nameCate: controller
                                                                .category[index]
                                                                .name_category);

                                                    controller
                                                        .changecurrentindex(
                                                            index: index);
                                                  },
                                                  child: AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                    margin:
                                                        const EdgeInsets.all(5),
                                                    width: 80,
                                                    height: 45,
                                                    decoration: BoxDecoration(
                                                        color: controller
                                                                    .currentindex ==
                                                                index
                                                            ? Colors.white70
                                                            : Colors.white54,
                                                        borderRadius: controller
                                                                    .currentindex ==
                                                                index
                                                            ? BorderRadius
                                                                .circular(15)
                                                            : BorderRadius
                                                                .circular(10),
                                                        border: controller
                                                                    .currentindex ==
                                                                index
                                                            ? Border.all(
                                                                color: colors
                                                                    .textcolors,
                                                                width: 4)
                                                            : null),
                                                    child: Center(
                                                        child: TextDefault(
                                                            maxLine: 1,
                                                            colorText: controller
                                                                        .currentindex ==
                                                                    index
                                                                ? colors
                                                                    .textcolors
                                                                : colors.appbar,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontsize: 15,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            contentText: controller
                                                                .category[index]
                                                                .name_category)),
                                                  ),
                                                ),
                                                Visibility(
                                                    visible: controller
                                                            .currentindex ==
                                                        index,
                                                    child: Container(
                                                      height: 5,
                                                      width: 5,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: colors
                                                              .textcolors),
                                                    ))
                                              ],
                                            );
                                          },
                                          itemCount:
                                              controller.category.length),
                                    ),
                                    Expanded(
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(
                                                      '/AddMedcineToCart',
                                                      parameters: {
                                                        'id':
                                                            '${result[index].id}',
                                                        'orderId':
                                                            '${controller.orderId}',
                                                        'medId':
                                                            '${result[index].id}',
                                                        'medPrice':
                                                            '${result[index].pharmcyPrice}',
                                                        'MedName':
                                                            result[index].name,
                                                        'status':
                                                            '${result[index].status}',
                                                        'mg':
                                                            '${result[index].mg}',
                                                        'description':
                                                            result[index]
                                                                .description,
                                                        'imageUrl':
                                                            result[index]
                                                                .imageUrl,
                                                        'customerprice':
                                                            '${controller.medcine[index].price_customer}',
                                                      });
                                                },
                                                child: newMethod(
                                                    size, controller, index));
                                          },
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                                width: size.width * 0.1,
                                              ),
                                          itemCount: result.length),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.1,
                              ),
                              Container(
                                height: size.height * 0.05,
                                width: size.width * 0.8,
                                color: colors.textcolors,
                                child: MaterialButton(
                                  onPressed: () {
                                    controller.createOrder();
                                  },
                                  child: TextDefault(
                                      maxLine: 1,
                                      colorText: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 30,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText: 'CreateOrder'),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                );
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
                                          warehouseID:
                                              '${controller.warehouses[0].id}',
                                          nameCate: controller
                                              .category[index].name_category);
                                      controller.changecurrentindex(
                                          index: index);
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      margin: const EdgeInsets.all(5),
                                      width: 80,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color:
                                              controller.currentindex == index
                                                  ? Colors.white70
                                                  : Colors.white54,
                                          borderRadius:
                                              controller.currentindex == index
                                                  ? BorderRadius.circular(15)
                                                  : BorderRadius.circular(10),
                                          border: controller.currentindex ==
                                                  index
                                              ? Border.all(
                                                  color: colors.textcolors,
                                                  width: 4)
                                              : null),
                                      child: Center(
                                          child: TextDefault(
                                              maxLine: 1,
                                              colorText:
                                                  controller.currentindex ==
                                                          index
                                                      ? colors.textcolors
                                                      : colors.appbar,
                                              fontWeight: FontWeight.bold,
                                              fontsize: 15,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
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
          ));
    } else {
      return const Text('no medcine');
    }
  }
}

// ignore: camel_case_types, must_be_immutable
class circularButtom extends StatelessWidget {
  circularButtom({
    required this.textcolor,
    required this.icon,
    required this.onLongPress,
    required this.onLongPressEnd,
    required this.onTap,
    super.key,
  });
  Icon icon;
  Color textcolor;
  void Function()? onLongPress;
  void Function(LongPressEndDetails)? onLongPressEnd;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: onLongPress,
        onLongPressEnd: onLongPressEnd,
        onTap: onTap,
        child: CircleAvatar(
          maxRadius: 16,
          backgroundColor: textcolor,
          child: icon,
        ));
  }
}

Container newMethod(
    Size size, WarehouseMedcineController controller, int index) {
  MyColors colors = MyColors();
  return Container(
      padding: const EdgeInsets.all(35),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colors.conatinerColors,
      ),
      // color: Color.fromARGB(135, 100, 255, 219)),
      height: size.height * 0.05,
      width: size.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
              image: NetworkImage('${controller.medcine[index].imageUrl}'),
              height: size.height * 0.1,
              width: size.width * 0.3),
          TextDefault(
            contentText: controller.medcine[index].name,
            maxLine: 2,
            colorText: colors.textcolors,
            fontsize: 30,
            fontWeight: FontWeight.bold,
            textOverflow: TextOverflow.fade,
          ),
          Container(
            height: size.height * 0.002,
            width: size.width * 0.4,
            color: const Color.fromARGB(255, 216, 213, 213),
          ),
          TextDefault(
            contentText: 'mg: ${controller.medcine[index].mg}',
            maxLine: 2,
            colorText: colors.textcolors,
            fontsize: 15,
            fontWeight: FontWeight.bold,
            textOverflow: TextOverflow.fade,
          ),
          TextDefault(
            contentText: 'quantity: ${controller.medcine[index].quantity}',
            maxLine: 2,
            colorText: colors.textcolors,
            fontsize: 15,
            fontWeight: FontWeight.bold,
            textOverflow: TextOverflow.fade,
          ),
          TextDefault(
            contentText: 'exp: ${controller.medcine[index].exp}',
            maxLine: 2,
            colorText: colors.textcolors,
            fontsize: 15,
            fontWeight: FontWeight.bold,
            textOverflow: TextOverflow.fade,
          ),
          Row(
            children: [
              TextDefault(
                contentText: 'Need Racheta',
                maxLine: 2,
                colorText: colors.textcolors,
                fontsize: 15,
                fontWeight: FontWeight.bold,
                textOverflow: TextOverflow.fade,
              ),
              controller.medcine[index].status == 0
                  ? Icon(Icons.check)
                  : Icon(Icons.cancel_sharp)
            ],
          ),
        ],
      ));
}
