// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/core/constant/constants.dart';
import 'package:pharmcy_app/feature/mdecine_page/presention/getx_medcine_feature/my_medcine_controller.dart';
import 'package:pharmcy_app/feature/mdecine_page/presention/widget/widget.dart';

import '../../../../core/colors/colors.dart';

// ignore: use_key_in_widget_constructors
class MyMedcinePage extends StatelessWidget {
  late MyColors colors = MyColors();

  MyMedcineController conrtroller = Get.find();
  TextEditingController newquanityt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 216, 213, 213),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              iconSize: 30,
              onTap: conrtroller.changePage,
              elevation: 3,
              currentIndex: conrtroller.currentIndex.value,
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
            iconTheme: IconThemeData(color: colors.textcolors),
            backgroundColor: Colors.white,
            title: Text(
              'MyMedcine',
              style: TextStyle(color: colors.textcolors),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    final result = showSearch(
                        context: context,
                        delegate: mymedcinesearch(
                            idwarehouse: '1',
                            orderId: '1',
                            med: conrtroller.myMedcineList,
                            myMedcineController: conrtroller,
                            size: size,
                            newquanityt: newquanityt));
                  },
                  icon: Icon(
                    Icons.search,
                    size: 30,
                    color: colors.textcolors,
                  )),
            ]),
        body: GetBuilder<MyMedcineController>(builder: (controller) {
          if (controller.myMedcineList.isNotEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                //refrech my med list
                controller.GetMyMedcineList();
              },
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
                                   conrtroller.getMedByCategory(catenam: controller.category[index].name_category);

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
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(16),
                              child: Card(
                                elevation: 2,
                                child: Container(
                                    padding: const EdgeInsets.all(25),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: colors.conatinerColors,
                                    ),
                                    // color: Color.fromARGB(135, 100, 255, 219)),
                                    height: size.height * 0.5,
                                    width: size.width * 0.8,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.4,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              TextDefault(
                                                contentText: controller
                                                    .myMedcineList[index]
                                                    .name_med,
                                                maxLine: 2,
                                                colorText: colors.textcolors,
                                                fontsize: 30,
                                                fontWeight: FontWeight.bold,
                                                textOverflow: TextOverflow.fade,
                                              ),
                                              Container(
                                                height: size.height * 0.006,
                                                width: size.width * 0.4,
                                                color: const Color.fromARGB(
                                                    255, 216, 213, 213),
                                              ),
                                              TextDefault(
                                                contentText:
                                                    'pharamacy price:${controller.myMedcineList[index].price_pharmacy}',
                                                maxLine: 2,
                                                colorText: colors.textcolors,
                                                fontsize: 20,
                                                fontWeight: FontWeight.bold,
                                                textOverflow: TextOverflow.fade,
                                              ),
                                              Container(
                                                height: size.height * 0.006,
                                                width: size.width * 0.3,
                                                color: const Color.fromARGB(
                                                    255, 216, 213, 213),
                                              ),
                                              TextDefault(
                                                contentText:
                                                    'customer price:${controller.myMedcineList[index].price_customer}',
                                                maxLine: 2,
                                                colorText: colors.textcolors,
                                                fontsize: 20,
                                                fontWeight: FontWeight.bold,
                                                textOverflow: TextOverflow.fade,
                                              ),
                                              TextDefault(
                                                contentText:
                                                    'mg: ${controller.myMedcineList[index].mg}',
                                                maxLine: 2,
                                                colorText: colors.textcolors,
                                                fontsize: 20,
                                                fontWeight: FontWeight.bold,
                                                textOverflow: TextOverflow.fade,
                                              ),
                                              TextDefault(
                                                contentText:
                                                    'quantity: ${controller.myMedcineList[index].quantity}',
                                                maxLine: 2,
                                                colorText: colors.textcolors,
                                                fontsize: 20,
                                                fontWeight: FontWeight.bold,
                                                textOverflow: TextOverflow.fade,
                                              ),
                                              TextDefault(
                                                contentText: controller
                                                            .myMedcineList[
                                                                index]
                                                            .mg ==
                                                        0
                                                    ? ' dont need a Rezpit'
                                                    : 'need A Rezpit',
                                                maxLine: 2,
                                                colorText: colors.textcolors,
                                                fontsize: 20,
                                                fontWeight: FontWeight.bold,
                                                textOverflow: TextOverflow.fade,
                                              ),
                                              TextDefault(
                                                contentText:
                                                    'exp: ${controller.myMedcineList[index].exp}',
                                                maxLine: 2,
                                                colorText: colors.textcolors,
                                                fontsize: 20,
                                                fontWeight: FontWeight.bold,
                                                textOverflow: TextOverflow.fade,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                        border: Border.all(
                                                          width: 1,
                                                          color:
                                                              const Color.fromARGB(
                                                                  255,
                                                                  217,
                                                                  214,
                                                                  214),
                                                        )),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        Get.defaultDialog(
                                                          content: TextFormField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            controller: newquanityt,
                                                          ),
                                                          title:
                                                              'add new amount for your peoduct this amount will add',
                                                          confirm: IconButton(
                                                              icon: Icon(
                                                                Icons.check,
                                                                color:
                                                                    colors.appbar,
                                                              ),
                                                              onPressed: () async {
                                                                controller.deleteQuanityofMedcieMethod(
                                                                    medId:
                                                                        '${controller.myMedcineList[index].id}',
                                                                    requested_quantity:
                                                                        newquanityt
                                                                            .text
                                                                            .toString());
                                                                controller
                                                                    .GetMyMedcineList();
                                                                Get.back();
                                                              }),
                                                          cancel: IconButton(
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                              icon: Icon(
                                                                Icons.cancel,
                                                                color:
                                                                    colors.appbar,
                                                              )),
                                                        );
                                                      },
                                                      icon: const Icon(
                                                        Icons.remove,
                                                        size: 30,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  )
                                          , SizedBox(width: size.width*0.05,),
                                                                                           
                                           Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                        border: Border.all(
                                                          width: 1,
                                                          color:
                                                              const Color.fromARGB(
                                                                  255,
                                                                  217,
                                                                  214,
                                                                  214),
                                                        )),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        Get.defaultDialog(
                                                        
                                                         content: Text('Delete Medcine ?'),
                                                          confirm: IconButton(
                                                              icon: Icon(
                                                                Icons.check,
                                                                color:
                                                                    colors.appbar,
                                                              ),
                                                              onPressed: () async {
                                                                controller.deleteMedcine(
                                                                    medId:
                                                                        '${controller.myMedcineList[index].id}',
                                                                  
                                                                );
                                                                Get.back();
                                                              }),
                                                          cancel: IconButton(
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                              icon: Icon(
                                                                Icons.cancel,
                                                                color:
                                                                    colors.appbar,
                                                              )),
                                                        );
                                                      },
                                                      icon: const Icon(
                                                        Icons.delete,
                                                        size: 30,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                         
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 90, left: 30),
                                          child: SizedBox(
                                            width: size.width * 0.3,
                                            height: size.height * 0.3,
                                            child: Image(
                                              image: NetworkImage(controller
                                                  .myMedcineList[index].image),
                                              height: size.height * 0.40,
                                              width: size.width * 0.30,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: size.height * 0.07,
                            ),
                        itemCount: controller.myMedcineList.length),
                  ),
                ],
              ),
            );
          } else {
            return RefreshIndicator(
              color: colors.textcolors,
              onRefresh: () => controller.GetMyMedcineList(),
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
                  Expanded(
                    child: ListView(
                      children: [
                        Center(
                          child: controller.isLoading
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
                  ),
                ],
              ),
            );
          }
        }));
  }
}
