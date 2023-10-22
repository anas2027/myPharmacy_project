import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/core/colors/colors.dart';
import 'package:pharmcy_app/core/constant/constants.dart';
import 'package:pharmcy_app/feature/drawer/presntion/get_x/dashboard_getx/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  DashBoardController dashBoardController = Get.find();
  late MyColors colors = MyColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(235, 247, 235, 235),
      appBar: AppBar(
        title: Text('the most medicen',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        
      ),
      body: GetBuilder<DashBoardController>(
        builder: (controller) {
          if (controller.medcineSold.isEmpty) {
            return RefreshIndicator(
                color: colors.textcolors,
                onRefresh: () async {
                  Null;
                },
                child: ListView(children: [
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Center(
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
                          );
                        }),
                  )
                ]));
          } else {
            return Container(
              height: 400,
              width: 1000,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(                
                    children: [
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) =>Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                       height: 120,
                                       width: 100,
                                       child: Image(image: NetworkImage('${controller.medcineSold[index].image}'))),
                                         SizedBox(
                                          width:60,
                                         ),
                                         
                                      TextDefault(maxLine: 1,
                                       colorText: colors.textcolors,
                                        fontWeight: FontWeight.bold,
                                         fontsize: 30,
                                          textOverflow: TextOverflow.ellipsis,
                                           contentText: ' ${controller.medcineSold[index].name_med}'),
                                          
                                
                                           
                                    ],
                                     
                                  ),
                                ),
                               
                                 Divider(
                                          color: Color.fromARGB(255, 169, 161, 161),
                                          thickness: 1,
                                          
                                         ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                       Row(
                                         children: [
                                           TextDefault(maxLine: 1,
                                            colorText: colors.textcolors,
                                             fontWeight: FontWeight.normal,
                                              fontsize: 30,
                                               textOverflow: TextOverflow.ellipsis,
                                                contentText: controller.medcineSold[index].descrption),                                              SizedBox(width: 10,),
                              
                                                  TextDefault(maxLine: 1,
                                            colorText: colors.textcolors,
                                             fontWeight: FontWeight.bold,
                                              fontsize: 30,
                                               textOverflow: TextOverflow.ellipsis,
                                                contentText: 'tablet'),
                                         ],
                                       ),
                                        Row(
                                         children: [
                                           TextDefault(maxLine: 1,
                                            colorText: colors.textcolors,
                                             fontWeight: FontWeight.bold,
                                              fontsize: 30,
                                               textOverflow: TextOverflow.ellipsis,
                                                contentText: 'MG:'),
                                                SizedBox(width: 10,),
                                                  TextDefault(maxLine: 1,
                                            colorText: colors.textcolors,
                                             fontWeight: FontWeight.normal,
                                              fontsize: 30,
                                               textOverflow: TextOverflow.ellipsis,
                                                contentText: '${controller.medcineSold[index].mg}'),
                                         ],
                                       ),
                                        Row(
                                         children: [
                                           TextDefault(maxLine: 1,
                                            colorText: colors.textcolors,
                                             fontWeight: FontWeight.bold,
                                              fontsize: 30,
                                               textOverflow: TextOverflow.ellipsis,
                                                contentText: 'CustomerPrice:'),
                                                                                              SizedBox(width: 10,),
                              
                                                  TextDefault(maxLine: 1,
                                            colorText: colors.textcolors,
                                             fontWeight: FontWeight.normal,
                                              fontsize: 30,
                                               textOverflow: TextOverflow.ellipsis,
                                                contentText: '${controller.medcineSold[index].price_customer}'),
                                         ],
                                       ),
                                        Row(
                                         children: [
                                           TextDefault(maxLine: 1,
                                            colorText: colors.textcolors,
                                             fontWeight: FontWeight.bold,
                                              fontsize: 30,
                                               textOverflow: TextOverflow.ellipsis,
                                                contentText: 'PharmacyPrice:'),
                                                SizedBox(width: 10,),
                                                  TextDefault(maxLine: 1,
                                            colorText: colors.textcolors,
                                             fontWeight: FontWeight.bold,
                                              fontsize: 30,
                                               textOverflow: TextOverflow.ellipsis,
                                                contentText: '${controller.medcineSold[index].price_pharmacy}'),
                                         ],
                                       ),
                                        Row(
                                         children: [
                                           TextDefault(maxLine: 1,
                                            colorText: colors.textcolors,
                                             fontWeight: FontWeight.bold,
                                              fontsize: 30,
                                               textOverflow: TextOverflow.ellipsis,
                                                contentText: 'Quantity:'),
                                                                                              SizedBox(width: 10,),
                              
                                                  TextDefault(maxLine: 1,
                                            colorText: colors.textcolors,
                                             fontWeight: FontWeight.normal,
                                              fontsize: 30,
                                               textOverflow: TextOverflow.ellipsis,
                                                contentText: '${controller.medcineSold[index].descrption}'),
                                         ],
                                       ),
                                        
                                  ],
                                ),
                              )
                                            
                                             
                                                ],
                            ),
                            separatorBuilder: (context, index) {
                              return SizedBox();
                            },
                            itemCount: controller.medcineSold.length),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
