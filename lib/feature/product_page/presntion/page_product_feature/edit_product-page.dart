// ignore_for_file: file_names, use_key_in_widget_constructors, must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/feature/product_page/presntion/getx_product_feature/edit_product/edit_product_controller.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/constant/constants.dart';

class EditProductPage extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController descrption = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController price = TextEditingController();
  EditProductController controller = Get.find();
  late MyColors colors = MyColors();
  Map<String, String?> parameters = Get.parameters;
  int medid = 1;
  @override
  Widget build(BuildContext context) {
    medid = int.parse('${parameters['id']}');
    name.text = '${parameters['name']}';
    descrption.text = '${parameters['descrption']}';
    controller.counter = int.parse('${parameters['quantity']}');

    image.text = '${parameters['image']}';

    price.text = '${parameters['price']}';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: colors.textcolors,
            ),
            onPressed: () {
              Get.offAndToNamed('/MyProduct');
            }),
        centerTitle: true,
        backgroundColor: colors.appbar,
        title: Text(
          'Edit Your Product',
          style: TextStyle(color: colors.textcolors),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Confirm',
            style: TextStyle(
                color: colors.textcolors,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          FloatingActionButton(
            onPressed: () {
              controller.editProduct(
                name: name.text.toString(),
                description: descrption.text.toString(),
                images: image.text.toString(),
                medId: medid,
                price: int.parse(price.text.toString()),
                quantity: controller.counter,
              );
            },
            backgroundColor: colors.appbar,
            child: const Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
            itemBuilder: (context, index) {
              if (index == 3) {
                return GetBuilder<EditProductController>(
                  builder: (controller) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            'Count',
                            style: TextStyle(
                                fontSize: 30, color: colors.textcolors),
                          )),
                      circularButtom(
                        textcolor: colors.textcolors,
                        icon: const Icon(Icons.add),
                        onLongPress: () => controller.onLongPressSUm(),
                        onLongPressEnd: (_) =>
                            controller.onLongPressSumCanscle(),
                        onTap: () => controller.countersum(),
                      ),
                      Text(
                        '${controller.counter}',
                        style:
                            TextStyle(fontSize: 30, color: colors.textcolors),
                      ),
                      circularButtom(
                        textcolor: colors.textcolors,
                        icon: const Icon(Icons.minimize),
                        onLongPress: () => controller.onLongPressMin(),
                        onLongPressEnd: (p0) =>
                            controller.onLongPressMinCanscle(),
                        onTap: () => controller.counterMin(),
                      )
                    ],
                  ),
                );
              } else {
                return TextFormField(
                  keyboardType: (index == 0)
                      ? TextInputType.name
                      : (index == 1)
                          ? TextInputType.multiline
                          : (index == 2)
                              ? TextInputType.multiline
                              : TextInputType.number,
                  controller: (index == 0)
                      ? name
                      : (index == 1)
                          ? descrption
                          : (index == 2)
                              ? image
                              : price,
                  decoration: InputDecoration(
                    prefixIcon: controller.prefixIcon[index],
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: colors.appbar,
                            width: 5,
                            style: BorderStyle.solid)),
                    hintText: '${controller.hintText[index]}',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: colors.appbar,
                            width: 5,
                            style: BorderStyle.solid)),
                  ),
                );
              }
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: controller.hintText.length),
      ),
    );
  }
}
