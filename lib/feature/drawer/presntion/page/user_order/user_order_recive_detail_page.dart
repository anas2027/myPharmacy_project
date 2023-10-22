import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/core/colors/colors.dart';
import 'package:pharmcy_app/feature/drawer/presntion/get_x/user_order_recive_detail_getx/user_order_recive_detail_controller.dart';

import '../../../../../core/constant/constants.dart';

class UserOrderReciveDetailPage extends StatelessWidget {
  MyColors colors = MyColors();
  UserOrderReciveDetailController controller = Get.find();
  var userInfo = Get.parameters;
  @override
  Widget build(BuildContext context) {
    String username = '${userInfo['username']}';
    String usercity = '${userInfo['usercity']}';
    String userphone = '${userInfo['userphone']}';
    String userstreet = '${userInfo['userstreet']}';
  String orderId = '${userInfo['orderId']}';
  String orderstatus = '${userInfo['orderstatus']}';
  String totalPrice='${userInfo['totalPrice']}';
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(),
        body:
            GetBuilder<UserOrderReciveDetailController>(builder: (controller) {
          return RefreshIndicator(
            color: colors.textcolors,
            onRefresh: () async {
              controller.getuserordermedcien();
            },
            child: ListView.separated(
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(18),
                      child: Card(
                        elevation: 30,
                        child: Container(
                          height: size.height * 0.89,
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
                                            maxLine: 1,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 30,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText: username),
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
                                          contentText: userphone),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: const Color.fromARGB(255, 216, 213, 213),
                                height: size.height * 0.001,
                                width: double.infinity,
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
                                        contentText: '$totalPrice \$',
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
                                        borderRadius: BorderRadius.circular(30),
                                        color: colors.conatinerColors,
                                      ),
                                      child: Center(
                                        child: TextDefault(
                                            maxLine: 1,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 20,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText:  int.parse('$orderstatus') == 1? 'Confirmed':'waiting'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 25,
                                width: double.infinity,
                                color: const Color.fromARGB(255, 216, 213, 213),
                                child: TextDefault(
                                    maxLine: 1,
                                    colorText: colors.textcolors,
                                    fontWeight: FontWeight.bold,
                                    fontsize: 20,
                                    textOverflow: TextOverflow.ellipsis,
                                    contentText: 'Medcine Order'),
                              ),
                              //////////////////  OrderMedicne////////////////////////////////
                              controller.userorderMedcine.isEmpty
                                  ? Text('No Medcine on this order')
                                  : SizedBox(
                                      height: size.height * 0.35,
                                      width: size.width * 0.8,
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Image(
                                                    image: NetworkImage(
                                                        '${controller.userorderMedcine[index].image}'),
                                                    height: 100,
                                                  ),
                                                  SizedBox(
                                                    width: size.width*0.4,
                                                    child: TextDefault(
                                                        maxLine: 1,
                                                        colorText:
                                                            colors.textcolors,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontsize: 28,
                                                        textOverflow:
                                                            TextOverflow.ellipsis,
                                                        contentText:
                                                            '${controller.userorderMedcine[index].name_med}'),
                                                  ),
                                                  TextDefault(
                                                      maxLine: 1,
                                                      colorText:
                                                          colors.textcolors,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontsize: 25,
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      contentText:
                                                          '${controller.userorderMedcine[index].price}'),
                                                            TextDefault(
                                                      maxLine: 1,
                                                      colorText:
                                                          colors.textcolors,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontsize: 20,
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      contentText:
                                                          '${controller.userorderMedcine[index].exp}'),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20),
                                                    child: Container(
                                                      height:
                                                          size.height * 0.04,
                                                      width: size.width * 0.3,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 0.9,
                                                          color: const Color
                                                                  .fromARGB(255,
                                                              216, 213, 213),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        color: colors
                                                            .conatinerColors,
                                                      ),
                                                      child: Center(
                                                        child: TextDefault(
                                                            maxLine: 1,
                                                            colorText: colors
                                                                .textcolors,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontsize: 20,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            contentText: controller
                                                                        .userorderMedcine[
                                                                            index]
                                                                        .status ==
                                                                    0
                                                                ? 'confirm'
                                                                : 'waiting'),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      int.parse('${controller.userorderMedcine[index].status} ') ==1
                                                    ? IconButton(onPressed: ()async{
                                                   
                                                      controller.getrachitImage(orderDetailId: '${controller.userorderMedcine[index].id}');

                                                      
                                                        
                                                     }, icon:Icon(Icons.camera)):Text(''),




                                                      controller
                                                                  .userorderMedcine[
                                                                      index]
                                                                  .status ==
                                                              1
                                                          ? Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 30),
                                                              child: IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    controller.confirmOrderDetail(
                                                                        orderDetailId:
                                                                            '${controller.userorderMedcine[index].id}');
                                                                    controller
                                                                        .getuserordermedcien();
                                                                  },
                                                                  icon: Icon(
                                                                    Icons.check,
                                                                    color: colors
                                                                        .appbar,
                                                                    size: 40,
                                                                  )),
                                                            )
                                                          :Text('')   ],
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return Divider(
                                              height: 5,
                                              thickness: 3,
                                              color: colors.textcolors,
                                            );
                                          },
                                          itemCount: controller
                                              .userorderMedcine.length),
                                    ),
                              Container(
                                height: size.height*0.03,
                                width: double.infinity,
                                color: const Color.fromARGB(255, 216, 213, 213),
                                child: TextDefault(
                                    maxLine: 1,
                                    colorText: colors.textcolors,
                                    fontWeight: FontWeight.bold,
                                    fontsize: 20,
                                    textOverflow: TextOverflow.ellipsis,
                                    contentText: 'ProductOrder'),
                              ),
                              controller.userOrderproduct.isEmpty
                                  ? Text('No Product on this order')
                                  : SizedBox(
                                    width: size.width*0.8,
                                      height: size.height * 0.3,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: size.height*0.09,
                                                      child: Image(image: NetworkImage('${controller.userOrderproduct[index].images}'),height: size.height*0.12,)),
                                                SizedBox(
                                                width: size.width*0.3,
                                                child: TextDefault(maxLine: 1,
                                                 colorText: colors.textcolors,
                                                  fontWeight: FontWeight.bold,
                                                   fontsize: 30,
                                                    textOverflow: TextOverflow.ellipsis,
                                                     contentText: '${controller.userOrderproduct[index].name}'),
                                                                                            ) ,TextDefault(maxLine: 1,
                                                                                             colorText: colors.textcolors,
                                                fontWeight: FontWeight.bold,
                                                 fontsize: 30,
                                                  textOverflow: TextOverflow.ellipsis,
                                                   contentText: ' ${controller.userOrderproduct[index].quantity}') ,TextDefault(maxLine: 1,
                                                                                             colorText: colors.textcolors,
                                                fontWeight: FontWeight.bold,
                                                 fontsize: 30,
                                                  textOverflow: TextOverflow.ellipsis,
                                                   contentText: '${controller.userOrderproduct[index].price}')
                                                                                            
                                                                                            
                                                  ],
                                                )
                                              ,],),
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return  Divider(
                                              height: 5,
                                              thickness: 1,
                                              color: colors.textcolors,
                                            );
                                          },
                                          itemCount: controller
                                              .userOrderproduct.length),
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
        }));
  }
}
