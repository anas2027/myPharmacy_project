// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, annotate_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/core/colors/colors.dart';
import 'package:pharmcy_app/core/constant/constants.dart';
import 'package:pharmcy_app/core/widget/widget.dart';

import '../get_x/home_page/home_page_controller.dart';

class HomePageScreen extends StatelessWidget {
  final resp = Get.parameters;
  var list = [
    'Damascus',
    'Homs',
    'latatkia',
    'Allepo',
    'idlib',
    'daraa',
    'der zore'
  ];

  HomePageController controller = Get.find();
  late MyColors colors = MyColors();
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
      drawer: Programdrawer(size: size, colors: colors, controller: controller),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colors.appbar,
        title: FutureBuilder(
          future: controller.getphName(),
          builder: (context, snapshot) => Text(
            "${snapshot.data}",
            style: TextStyle(color: colors.textcolors),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed('/alert');
              },
              icon: const Icon(
                Icons.notification_important_sharp,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      body: GetBuilder<HomePageController>(
        builder: (controller) {
          if (controller.warehouses.isEmpty) {
            return RefreshIndicator(
              color: colors.textcolors,
              onRefresh: () => controller.getWarehouse(),
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
                                  controller.changecurrentindex(index: index);
                                  controller.getWarehouseByCity(
                                      city: controller.cities[index]);
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
                                          contentText:
                                              controller.cities[index])),
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
                        itemCount: controller.cities.length),
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
                                '\n\n\n\n\n\n\n\n\n\n there is no warehouse in this city :('),
                  ),
                ],
              ),
            );
          } else {
            return RefreshIndicator(
              color: colors.textcolors,
              onRefresh: () => controller.RefrechWarehouse(),
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
                                  controller.changecurrentindex(index: index);
                                  controller.getWarehouseByCity(
                                      city: controller.cities[index]);
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
                                          contentText:
                                              controller.cities[index])),
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
                        itemCount: controller.cities.length),
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/warehouseMedcine', parameters: {
                                    'idware':
                                        '${controller.warehouses[index].id}',
                                    'id': '0'
                                  });
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: colors.appbar,
                                    ),
                                    height: size.height * 0.32,
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: size.height * 0.2,
                                          child: Image(
                                            image:
                                                NetworkImage(controller.image),
                                            height: size.height * 0.2,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: TextDefault(
                                                        maxLine: 1,
                                                        colorText:
                                                            colors.textcolors,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontsize: 25,
                                                        textOverflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                        contentText: controller
                                                            .warehouses[index]
                                                            .name),
                                                  ),
                                              
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: TextDefault(
                                                        maxLine: 1,
                                                        colorText:
                                                            colors.textcolors,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontsize: 15,
                                                        textOverflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                        contentText:
                                                            'phone ${controller.warehouses[index].phone}'),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(1),
                                                    child: TextDefault(
                                                        maxLine: 2,
                                                        colorText:
                                                            colors.textcolors,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontsize: 15,
                                                        textOverflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                        contentText:
                                                            'city: ${controller.warehouses[index].city} \n street: ${controller.warehouses[index].street}'),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: controller.warehouses.length),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
