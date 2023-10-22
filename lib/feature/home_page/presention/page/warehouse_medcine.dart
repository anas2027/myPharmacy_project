// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/core/constant/constants.dart';
import 'package:pharmcy_app/feature/home_page/presention/get_x/warehouse_medcine/warehouse_medcine_contoller.dart';

import '../../../../core/colors/colors.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class WarehouseMedcinePage extends StatelessWidget {
  WarehouseMedcineController controller = Get.find();
  late MyColors colors = MyColors();
  var idware = Get.parameters;
  String image =
      'https://akm-img-a-in.tosshub.com/businesstoday/images/story/202210/64e01bf1f7dbd9099e249e9c3247fdbb9a46b4b1-1280x720-sixteen_nine.jpg';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String idawrehuose ='${idware['idware']}';
    return Scaffold(
        backgroundColor: Color.fromARGB(252, 242, 239, 239),
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(size.height * 0.4), // here the desired height
          child: GetBuilder<WarehouseMedcineController>(
            builder: (controller) {
              if (controller.warehouses.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(
                    color: colors.textcolors,
                  ),
                );
              } else {
                return Stack(
                  children: [
                    AppBar(
                      flexibleSpace: SizedBox(
                          height: size.height * 0.3,
                          child: Image(
                              image: NetworkImage(image), fit: BoxFit.cover)),
                      leading: IconButton(
                          onPressed: () {
                            print(controller.orderId);
                            controller.orderId == 0
                                ? Get.offAndToNamed('/homePage')
                                : controller.deleteOrder(
                                    orderId: '${controller.orderId}');
                                    Get.deleteAll();
                          },
                          icon: const Icon(Icons.arrow_back)),
                      backgroundColor: Color.fromARGB(252, 242, 239, 239),
                      elevation: 0,
                      actions: [
                        IconButton(
                            onPressed: () {
                              final result = showSearch(
                                  context: context,
                                  delegate: MedcineSearch(
                                      idwarehouse: '${idware['id']}',
                                      orderId: '${controller.orderId}',
                                      med: controller.medcine,
                                      homePageController: controller,
                                      size: size));
                            },
                            icon: Icon(
                              Icons.search,
                              size: 30,
                              color: colors.textcolors,
                            )),
                        IconButton(
                            onPressed: () {
                              var orderId = '${idware['orderId']}';
                              Get.toNamed('/cartpage',
                                  parameters: {'orderId': orderId});
                            },
                            icon: Icon(
                              Icons.shopping_basket_outlined,
                              color: colors.textcolors,
                            )),
                        
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120, left: 35),
                      child: Container(
                        height: size.height * 0.3,
                        width: size.width * 0.85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    maxRadius: 25,
                                    backgroundImage: AssetImage(
                                        'assests/image/pharmacy.png'),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    maxRadius: 10,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 25,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText:
                                          controller.warehouses[0].name),
                                  TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.normal,
                                      fontsize: 15,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText: '12:00pm  - 12:00am'),
                                ],
                              ),
                              Container(
                                height: size.height * 0.01,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.2,
                                    child: TextDefault(
                                        maxLine: 3,
                                        colorText: colors.textcolors,
                                        fontWeight: FontWeight.normal,
                                        fontsize: 25,
                                        textOverflow: TextOverflow.ellipsis,
                                        contentText:
                                            controller.warehouses[0].city),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.2,
                                    child: TextDefault(
                                        maxLine: 3,
                                        colorText: colors.textcolors,
                                        fontWeight: FontWeight.normal,
                                        fontsize: 25,
                                        textOverflow: TextOverflow.ellipsis,
                                        contentText:
                                            controller.warehouses[0].street),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.2,
                                    child: TextDefault(
                                        maxLine: 3,
                                        colorText: colors.textcolors,
                                        fontWeight: FontWeight.normal,
                                        fontsize: 25,
                                        textOverflow: TextOverflow.ellipsis,
                                        contentText:
                                            '${controller.warehouses[0].phone}'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
        body: GetBuilder<WarehouseMedcineController>(builder: (controller) {
          if (controller.medcine.isNotEmpty) {
            return RefreshIndicator(
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
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              await controller.getmedbycategory(
                                                  warehouseID: idawrehuose,
                                                  nameCate: controller
                                                      .category[index]
                                                      .name_category);

                                              controller.changecurrentindex(
                                                  index: index);
                                            },
                                            child: AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              margin: const EdgeInsets.all(5),
                                              width: 80,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  color:
                                                      controller.currentindex ==
                                                              index
                                                          ? Colors.white70
                                                          : Colors.white54,
                                                  borderRadius: controller
                                                              .currentindex ==
                                                          index
                                                      ? BorderRadius.circular(
                                                          15)
                                                      : BorderRadius.circular(
                                                          10),
                                                  border: controller
                                                              .currentindex ==
                                                          index
                                                      ? Border.all(
                                                          color:
                                                              colors.textcolors,
                                                          width: 4)
                                                      : null),
                                              child: Center(
                                                  child: TextDefault(
                                                      maxLine: 1,
                                                      colorText: controller
                                                                  .currentindex ==
                                                              index
                                                          ? colors.textcolors
                                                          : colors.appbar,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontsize: 15,
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      contentText: controller
                                                          .category[index]
                                                          .name_category)),
                                            ),
                                          ),
                                          Visibility(
                                              visible:
                                                  controller.currentindex ==
                                                      index,
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
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            Get.toNamed('/AddMedcineToCart',
                                                parameters: {
                                                  'id': '${idware['id']}',
                                                  'orderId':
                                                      '${controller.orderId}',
                                                  'medId':
                                                      '${controller.medcine[index].id}',
                                                  'medPrice':
                                                      '${controller.medcine[index].pharmcyPrice}',
                                                  'MedName': controller
                                                      .medcine[index].name,
                                                  'status':
                                                      '${controller.medcine[index].status}',
                                                  'mg':
                                                      '${controller.medcine[index].mg}',
                                                  'description': controller
                                                      .medcine[index]
                                                      .description,
                                                  'imageUrl': controller
                                                      .medcine[index].imageUrl,
                                                  'customerprice':
                                                      '${controller.medcine[index].price_customer}',
                                                      'quantity':'${controller.medcine[index].quantity}'
                                                });
                                          },
                                          child: newMethod(
                                              size, controller, index));
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: size.width * 0.1,
                                        ),
                                    itemCount: controller.medcine.length),
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
                                      warehouseID:
                                          '${controller.warehouses[0].id}',
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
        }));
  }

  Container newMethod(
      Size size, WarehouseMedcineController controller, int index) {
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
              maxLine: 1,
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
                controller.medcine[index].status == 1
                    ? Icon(Icons.check)
                    : Icon(Icons.cancel_sharp)
              ],
            ),
          ],
        ));
  }
}
