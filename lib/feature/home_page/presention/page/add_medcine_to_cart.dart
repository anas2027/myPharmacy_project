// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pharmcy_app/core/constant/constants.dart';
import 'package:pharmcy_app/feature/home_page/presention/get_x/addmedcinetocart_getx/addmedcinetocart_controller.dart';

import '../../../../core/colors/colors.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class AddMedcineToCart extends StatelessWidget {
  late MyColors colors = MyColors();
  AddMedcineToCartController controller = Get.find();
  var data = Get.parameters;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var route = data['route'];
    var warehouseId = data['id'];
    var namewarehouse = data['namewarehouse'];
    var orderIds = data['orderId'];
    var statuss = data['statuss'];
    var customerprice = data['customerprice'];
    String quantity = '${data['quantity']}';
    print(orderIds);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              var orderId = '${data['orderId']}';
              var id = data['id'];

              route == 'edit'
                  ? Get.offAllNamed('/addnewmedtoyourcart', parameters: {
                      "warehouseid": '$warehouseId',
                      'namewarehous': '$namewarehouse',
                      'orderId': orderId,
                      'status': '$statuss',
                      'id': '$warehouseId',
                      "idware": "${data['idware']}",
                      'totalprice': "${data['totalprice']}"
                    })
                  : Get.toNamed('warehouseMedcine',
                      parameters: {'id': '${data['id']}', 'orderId': orderId});
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: size.height * 0.33,
                width: double.infinity,
                child: Image(
                    image: NetworkImage('${data['imageUrl']}'),
                    fit: BoxFit.cover)),
            Row(
              children: [
                Icon(Icons.medication_outlined,color: colors.textcolors),
      
                 TextDefault(
                    maxLine: 1,
                    colorText: colors.textcolors,
                    fontWeight: FontWeight.bold,
                    fontsize: 30,
                    textOverflow: TextOverflow.ellipsis,
                    contentText: 'MedName:'),
                    SizedBox(
                      width: size.width*0.03,
                    ),
                TextDefault(
                    maxLine: 1,
                    colorText: colors.textcolors,
                    fontWeight: FontWeight.normal,
                    fontsize: 30,
                    textOverflow: TextOverflow.ellipsis,
                    contentText: '${data['MedName']}'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.description
                ,color: colors.textcolors),
                TextDefault(
                    maxLine: 1,
                    colorText: colors.textcolors,
                    fontWeight: FontWeight.bold,
                    fontsize: 30,
                    textOverflow: TextOverflow.ellipsis,
                    contentText: 'Tablets:'),
               SizedBox(
                      width: size.width*0.03,
                    ),
                TextDefault(
                    maxLine: 1,
                    colorText: colors.textcolors,
                    fontWeight: FontWeight.normal,
                    fontsize: 30,
                    textOverflow: TextOverflow.ellipsis,
                    contentText: ' ${data['description']} tablet'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.margin,color: colors.textcolors),
                TextDefault(
                    maxLine: 1,
                    colorText: colors.textcolors,
                    fontWeight: FontWeight.bold,
                    fontsize: 30,
                    textOverflow: TextOverflow.ellipsis,
                    contentText: 'MG:'),
               SizedBox(
                      width: size.width*0.03,
                    ),
                TextDefault(
                    maxLine: 1,
                    colorText: colors.textcolors,
                    fontWeight: FontWeight.normal,
                    fontsize: 30,
                    textOverflow: TextOverflow.ellipsis,
                    contentText: '${data['mg']}'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.price_change,color: colors.textcolors),
                TextDefault(
                    maxLine: 1,
                    colorText: colors.textcolors,
                    fontWeight: FontWeight.bold,
                    fontsize: 30,
                    textOverflow: TextOverflow.ellipsis,
                    contentText: 'CustomerPrice:'),
               SizedBox(
                      width: size.width*0.03,
                    ),
                TextDefault(
                    maxLine: 1,
                    colorText: colors.textcolors,
                    fontWeight: FontWeight.normal,
                    fontsize: 30,
                    textOverflow: TextOverflow.ellipsis,
                    contentText: '${data['customerprice']}'),
              ],
            ),
      
            //medcineComposition
      
            Row(
              children: [
                Icon(Icons.price_change,color: colors.textcolors,),
                TextDefault(
                    maxLine: 1,
                    colorText: colors.textcolors,
                    fontWeight: FontWeight.bold,
                    fontsize: 30,
                    textOverflow: TextOverflow.ellipsis,
                    contentText: 'PharamacyPrice:'),
               SizedBox(
                      width: size.width*0.03,
                    ),
                TextDefault(
                    maxLine: 1,
                    colorText: colors.textcolors,
                    fontWeight: FontWeight.normal,
                    fontsize: 30,
                    textOverflow: TextOverflow.ellipsis,
                    contentText: '${data['medPrice']}'),
              ],
            ),
      
            
            Row(
              children: [
                Icon(Icons.api_sharp,color: colors.textcolors,),
                TextDefault(
                    maxLine: 1,
                    colorText: colors.textcolors,
                    fontWeight: FontWeight.bold,
                    fontsize: 30,
                    textOverflow: TextOverflow.ellipsis,
                    contentText: 'Quantity:'),
               SizedBox(
                      width: size.width*0.03,
                    ),
                TextDefault(
                    maxLine: 1,
                    colorText: colors.textcolors,
                    fontWeight: FontWeight.normal,
                    fontsize: 30,
                    textOverflow: TextOverflow.ellipsis,
                    contentText: ' $quantity'),
              ],
            ),
      
            SizedBox(
              height: size.height * 0.2,
            ),
            Container(
              color: Colors.grey[300],
              height: size.height * 0.015,
            ),
      
            int.parse('$orderIds') != 0
                ? GetBuilder<AddMedcineToCartController>(
                    builder: (controller) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onLongPress: () => controller.counter == 0
                              ? null
                              : controller.onLongPressMin(),
                          onLongPressEnd: (p0) => controller.counter == 0
                              ? null
                              : controller.onLongPressMinCanscle(),
                          child: IconButton(
                              onPressed: () {
                                controller.counter == 0
                                    ? null
                                    : controller.counterMin();
                              },
                              icon: Icon(
                                Icons.remove,
                                color: colors.appbar,
                                size: 30,
                              )),
                        ),
                        TextDefault(
                            maxLine: 1,
                            colorText: colors.textcolors,
                            fontWeight: FontWeight.bold,
                            fontsize: 30,
                            textOverflow: TextOverflow.ellipsis,
                            contentText: '${controller.counter}'),
                        GestureDetector(
                          onLongPress: () => controller.onLongPressSUm(),
                          onLongPressEnd: (_) =>
                              controller.onLongPressSumCanscle(),
                          child: IconButton(
                              onPressed: () {
                                controller.countersum();
                              },
                              icon: Icon(
                                Icons.add,
                                color: colors.appbar,
                                size: 30,
                              )),
                        )
                      ],
                    ),
                  )
                : Text(''),
            int.parse('$orderIds') != 0
                ? Container(
                    color: Colors.black12,
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () {
                        var quantity = controller.counter;
                        String medId = '${data['medId']}';
                        var status = ' ${data['status']}';
                        var orderId = '${data['orderId']}';
      
                        if (int.parse(status) == 0) {
                          controller.AddMedcineToCart(
                              medId, orderId, '$quantity');
                        } else {
                          if (controller.imageloaded == true) {
                            controller.AddMedcineToCart(
                                medId, orderId, '$quantity');
                            Get.showSnackbar(
                              const GetSnackBar(
                                isDismissible: true,
                                borderRadius: 15,
                                message: 'Medcine Add sucssufly to Cart',
                                duration: Duration(seconds: 3),
                              ),
                            );
                          } else {
                            controller.AddMedcineToCart(
                                medId, orderId, '$quantity');
                            Get.showSnackbar(
                              const GetSnackBar(
                                isDismissible: true,
                                borderRadius: 15,
                                message: 'Medcine Add sucssufly to Cart',
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        }
                      },
                      child: TextDefault(
                          maxLine: 1,
                          colorText: colors.textcolors,
                          fontWeight: FontWeight.bold,
                          fontsize: 30,
                          textOverflow: TextOverflow.ellipsis,
                          contentText: 'Add To Cart'),
                    ),
                  )
                : Text('')
          ],
        ),
      ),
    );
  }
}
