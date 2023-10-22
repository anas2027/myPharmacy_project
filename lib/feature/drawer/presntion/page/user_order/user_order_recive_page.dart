import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/core/constant/constants.dart';
import 'package:pharmcy_app/feature/drawer/presntion/get_x/user_order_recive_getx/user_order_recive_controller.dart';

import '../../../../../core/colors/colors.dart';

class UserOrderRecivePage extends StatelessWidget {
  UserOderReciveController controller = Get.find();
  late MyColors colors = MyColors();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'UserOrder',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: GetBuilder<UserOderReciveController>(builder: (controller) {
          if (controller.userOrderList.isEmpty) {
            return RefreshIndicator(
              color: colors.textcolors,
              onRefresh: () => controller.getUserOrder(),
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
                          Get.toNamed('/userorderdetail', parameters: {
                            'orderId': '${controller.userOrderList[index].id}',
                            'username':
                                controller.userOrderList[index].name_user,
                            'usercity':
                                controller.userOrderList[index].city_user,
                            'userphone':
                                '${controller.userOrderList[index].phone_user}',
                            'userstreet':
                                controller.userOrderList[index].street_user,
                                'orderstatus':'${controller.userOrderList[index].status}',
                                'totalPrice':'${controller.userOrderList[index].total_price}'
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
                                            'assests/image/gamer.png'),
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
                                                .userOrderList[index]
                                                .name_user),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: TextDefault(
                                                maxLine: 2,
                                                colorText: colors.textcolors,
                                                fontWeight: FontWeight.bold,
                                                fontsize: 15,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                contentText:
                                                    'phone num: ${controller.userOrderList[0].phone_user}'),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: TextDefault(
                                                maxLine: 2,
                                                colorText: colors.textcolors,
                                                fontWeight: FontWeight.bold,
                                                fontsize: 15,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                contentText:
                                                    'city user: ${controller.userOrderList[0].city_user}'),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: TextDefault(
                                                maxLine: 2,
                                                colorText: colors.textcolors,
                                                fontWeight: FontWeight.bold,
                                                fontsize: 15,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                contentText:
                                                    'city user: ${controller.userOrderList[0].street_user}'),
                                          ),
                                        ],
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
                                SizedBox(
                                  height: size.height * 0.06,
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
                                              '${controller.userOrderList[index].total_price} \$',
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
                                              contentText: controller
                                                          .userOrderList[index]
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
                itemCount: controller.userOrderList.length);
          }
        }));
  }
}
