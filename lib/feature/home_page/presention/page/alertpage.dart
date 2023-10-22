// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/core/colors/colors.dart';
import 'package:pharmcy_app/core/constant/constants.dart';

import '../get_x/alert_getx/alert_controller.dart';

class AlertPage extends StatelessWidget {
  late MyColors colors = MyColors();
  AlertController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<AlertController>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: (value) {
              controller.bodyChange(value: value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.abc), label: 'quantity Expierd'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.abc_outlined), label: 'Experied Med')
            ]),
        backgroundColor: const Color.fromARGB(255, 216, 213, 213),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Medcine About to Expierd'),
        ),
        body: GetBuilder<AlertController>(builder: (controller) {
          if (controller.medabouttoExpiredList.isNotEmpty) {
            return controller.currentIndex == 1
                ? ListView.separated(
                    itemBuilder: (context, index) => Card(
                      
                      elevation: 1,
                      child: Container(
                        height: size.height * 0.3,
                        width: double.infinity,
                        color: Colors.white,
                        child: Row(
                          children: [
                            SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextDefault(
                                        maxLine: 1,
                                        colorText: colors.textcolors,
                                        fontWeight: FontWeight.bold,
                                        fontsize: 25,
                                        textOverflow: TextOverflow.ellipsis,
                                        contentText: controller
                                            .medabouttoExpiredList[index]
                                            .name_med),
                                    TextDefault(
                                        maxLine: 1,
                                        colorText: colors.textcolors,
                                        fontWeight: FontWeight.bold,
                                        fontsize: 20,
                                        textOverflow: TextOverflow.ellipsis,
                                        contentText: controller
                                            .medabouttoExpiredList[index]
                                            .descrption),
                                    TextDefault(
                                        maxLine: 2,
                                        colorText: colors.textcolors,
                                        fontWeight: FontWeight.bold,
                                        fontsize: 20,
                                        textOverflow: TextOverflow.ellipsis,
                                        contentText:
                                            'count: ${controller.medabouttoExpiredList[index].quantity}'),
                                    TextDefault(
                                        maxLine: 1,
                                        colorText: colors.textcolors,
                                        fontWeight: FontWeight.bold,
                                        fontsize: 20,
                                        textOverflow: TextOverflow.ellipsis,
                                        contentText: controller
                                            .medabouttoExpiredList[index].exp),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.3,
                              width: size.width * 0.55,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, bottom: 90),
                                child: Image(
                                    image: NetworkImage(
                                        '${controller.medabouttoExpiredList[index].image}')),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => Divider(
                      height: 30,
                      color: const Color.fromARGB(255, 216, 213, 213),
                    ),
                    itemCount: controller.medabouttoExpiredList.length,
                  )
                : ListView.separated(
                    itemBuilder: (context, index) => Container(
                      height: size.height * 0.3,
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.45,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 25,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText: controller
                                          .qunatityMedcineOut[index].name_med),
                                  TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 20,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText: controller
                                          .qunatityMedcineOut[index]
                                          .descrption),
                                  TextDefault(
                                      maxLine: 2,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 20,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText:
                                          'count: ${controller.qunatityMedcineOut[index].quantity}'),
                                  TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 20,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText: controller
                                          .qunatityMedcineOut[index].exp),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.3,
                            width: size.width * 0.5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 40, bottom: 90),
                              child: Image(
                                  image: NetworkImage(
                                      '${controller.qunatityMedcineOut[index].image}')),
                            ),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => Divider(
                      height: 30,
                      color: const Color.fromARGB(255, 216, 213, 213),
                    ),
                    itemCount: controller.qunatityMedcineOut.length,
                  );
          } else {
            return RefreshIndicator(
              color: colors.textcolors,
              onRefresh: () => controller.getMedpharamcyExpired(),
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
                                '\n\n\n\n\n\n\n\n\n\n there is no warehouse in this city :('),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
