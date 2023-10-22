// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/core/constant/constants.dart';
import 'package:pharmcy_app/feature/product_page/presntion/getx_product_feature/add_product/add_product_controller.dart';

import '../../../../core/colors/colors.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class AddProductPage extends StatelessWidget {
  late MyColors colors = MyColors();
  TextEditingController name = TextEditingController();
  TextEditingController descrption = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController price = TextEditingController();
  AddProductContoller controller = Get.find();
  Map<String, String?> parameters = Get.parameters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              controller.addproduct(
                name: name.text.toString(),
                description: descrption.text.toString(),
                images: image.text.toString(),
                price: int.parse(price.text.toString()),
                quantity: controller.counter,
              );
            },
            backgroundColor: colors.textcolors,
            child: const Icon(Icons.check),
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Your product',
          style:
              TextStyle(color: colors.textcolors, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.offAndToNamed('/MyProduct');
            },
            icon: Icon(
              Icons.arrow_back,
              color: colors.textcolors,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
            itemBuilder: (context, index) {
              if (index == 3) {
                return GetBuilder<AddProductContoller>(
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
                            color: colors.textcolors,
                            width: 2,
                            style: BorderStyle.solid)),
                    hintText: controller.hintText[index],
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: colors.textcolors,
                            width: 2,
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
