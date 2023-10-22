// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/core/colors/colors.dart';

import '../../../../core/constant/constants.dart';

import '../../domain/entity/my_medcine.dart';
import '../getx_medcine_feature/my_medcine_controller.dart';

class mymedcinesearch extends SearchDelegate<String> {
  List<MyMedcine> med;
  Size size;
  MyMedcineController myMedcineController;
  TextEditingController newquanityt;
  String orderId;
  String idwarehouse;
  mymedcinesearch({
    required this.newquanityt,
    required this.idwarehouse,
    required this.orderId,
    required this.myMedcineController,
    required this.size,
    required this.med,
  });
  late MyColors colors = MyColors();

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, '');
            } else {
              query = '';
            }
          },
          icon: Icon(
            Icons.clear,
            color: colors.textcolors,
            size: 30,
          ),
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != null) {
      final result = med
          .where((element) =>
              element.name_med.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return ListView.separated(
        itemCount: result.length,
        itemBuilder: (context, index) {
          return Expanded(
            child: Padding(
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
                    height: size.height * 0.4,
                    width: size.width * 0.8,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextDefault(
                                contentText: result[index].name_med,
                                maxLine: 2,
                                colorText: colors.textcolors,
                                fontsize: 30,
                                fontWeight: FontWeight.bold,
                                textOverflow: TextOverflow.fade,
                              ),
                              Container(
                                height: size.height * 0.006,
                                width: size.width * 0.4,
                                color: const Color.fromARGB(255, 216, 213, 213),
                              ),
                              TextDefault(
                                contentText:
                                    'pharamacy price:${result[index].price_pharmacy}',
                                maxLine: 2,
                                colorText: colors.textcolors,
                                fontsize: 20,
                                fontWeight: FontWeight.bold,
                                textOverflow: TextOverflow.fade,
                              ),
                              Container(
                                height: size.height * 0.006,
                                width: size.width * 0.3,
                                color: const Color.fromARGB(255, 216, 213, 213),
                              ),
                              TextDefault(
                                contentText:
                                    'customer price:${result[index].price_customer}',
                                maxLine: 2,
                                colorText: colors.textcolors,
                                fontsize: 20,
                                fontWeight: FontWeight.bold,
                                textOverflow: TextOverflow.fade,
                              ),
                              TextDefault(
                                contentText: 'mg: ${result[index].mg}',
                                maxLine: 2,
                                colorText: colors.textcolors,
                                fontsize: 20,
                                fontWeight: FontWeight.bold,
                                textOverflow: TextOverflow.fade,
                              ),
                              TextDefault(
                                contentText:
                                    'quantity: ${result[index].quantity}',
                                maxLine: 2,
                                colorText: colors.textcolors,
                                fontsize: 20,
                                fontWeight: FontWeight.bold,
                                textOverflow: TextOverflow.fade,
                              ),
                              TextDefault(
                                contentText: result[index].mg == 0
                                    ? ' dont need a Rezpit'
                                    : 'need A Rezpit',
                                maxLine: 2,
                                colorText: colors.textcolors,
                                fontsize: 20,
                                fontWeight: FontWeight.bold,
                                textOverflow: TextOverflow.fade,
                              ),
                              TextDefault(
                                contentText: 'exp: ${result[index].exp}',
                                maxLine: 2,
                                colorText: colors.textcolors,
                                fontsize: 20,
                                fontWeight: FontWeight.bold,
                                textOverflow: TextOverflow.fade,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 217, 214, 214),
                                    )),
                                child: IconButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                      content: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: newquanityt,
                                      ),
                                      title:
                                          'add new amount for your peoduct this amount will add',
                                      confirm: IconButton(
                                          icon: Icon(
                                            Icons.check,
                                            color: colors.appbar,
                                          ),
                                          onPressed: () async {
                                            myMedcineController
                                                .deleteQuanityofMedcieMethod(
                                                    medId:
                                                        '${result[index].id}',
                                                    requested_quantity:
                                                        newquanityt.text
                                                            .toString());
                                            myMedcineController
                                                .GetMyMedcineList();
                                            Get.back();
                                            close(context, '');
                                          }),
                                      cancel: IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: Icon(
                                            Icons.cancel,
                                            color: colors.appbar,
                                          )),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.35,
                          height: size.height * 0.5,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 90, left: 30),
                            child: Image(
                              image: NetworkImage(result[index].image),
                              height: size.height * 0.40,
                              width: size.width * 0.30,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
      );
    } else {
      return const Text('no medcine');
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query != null) {
      final result = med
          .where((element) =>
              element.name_med.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return ListView.separated(
        itemCount: result.length,
        itemBuilder: (context, index) {
          return Expanded(
            child: Padding(
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
                    height: size.height * 0.4,
                    width: size.width * 0.8,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextDefault(
                                contentText: result[index].name_med,
                                maxLine: 2,
                                colorText: colors.textcolors,
                                fontsize: 30,
                                fontWeight: FontWeight.bold,
                                textOverflow: TextOverflow.fade,
                              ),
                              Container(
                                height: size.height * 0.006,
                                width: size.width * 0.4,
                                color: const Color.fromARGB(255, 216, 213, 213),
                              ),
                              TextDefault(
                                contentText:
                                    'pharamacy price:${result[index].price_pharmacy}',
                                maxLine: 2,
                                colorText: colors.textcolors,
                                fontsize: 20,
                                fontWeight: FontWeight.bold,
                                textOverflow: TextOverflow.fade,
                              ),
                              Container(
                                height: size.height * 0.006,
                                width: size.width * 0.3,
                                color: const Color.fromARGB(255, 216, 213, 213),
                              ),
                              TextDefault(
                                contentText:
                                    'customer price:${result[index].price_customer}',
                                maxLine: 2,
                                colorText: colors.textcolors,
                                fontsize: 20,
                                fontWeight: FontWeight.bold,
                                textOverflow: TextOverflow.fade,
                              ),
                              TextDefault(
                                contentText: 'mg: ${result[index].mg}',
                                maxLine: 2,
                                colorText: colors.textcolors,
                                fontsize: 20,
                                fontWeight: FontWeight.bold,
                                textOverflow: TextOverflow.fade,
                              ),
                              TextDefault(
                                contentText:
                                    'quantity: ${result[index].quantity}',
                                maxLine: 2,
                                colorText: colors.textcolors,
                                fontsize: 20,
                                fontWeight: FontWeight.bold,
                                textOverflow: TextOverflow.fade,
                              ),
                              TextDefault(
                                contentText: result[index].mg == 0
                                    ? ' dont need a Rezpit'
                                    : 'need A Rezpit',
                                maxLine: 2,
                                colorText: colors.textcolors,
                                fontsize: 20,
                                fontWeight: FontWeight.bold,
                                textOverflow: TextOverflow.fade,
                              ),
                              TextDefault(
                                contentText: 'exp: ${result[index].exp}',
                                maxLine: 2,
                                colorText: colors.textcolors,
                                fontsize: 20,
                                fontWeight: FontWeight.bold,
                                textOverflow: TextOverflow.fade,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 217, 214, 214),
                                    )),
                                child: IconButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                      content: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: newquanityt,
                                      ),
                                      title:
                                          'add new amount for your peoduct this amount will add',
                                      confirm: IconButton(
                                          icon: Icon(
                                            Icons.check,
                                            color: colors.appbar,
                                          ),
                                          onPressed: () async {
                                            myMedcineController
                                                .deleteQuanityofMedcieMethod(
                                                    medId:
                                                        '${result[index].id}',
                                                    requested_quantity:
                                                        newquanityt.text
                                                            .toString());
                                            myMedcineController
                                                .GetMyMedcineList();
                                            Get.back();
                                            close(context, '');
                                          }),
                                      cancel: IconButton(
                                          onPressed: () {
                                            myMedcineController.deleteMedcine(medId: '${result[index].id}');
                                            Get.back();
                                          },
                                          icon: Icon(
                                            Icons.cancel,
                                            color: colors.appbar,
                                          )),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.35,
                          height: size.height * 0.5,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 90, left: 30),
                            child: Image(
                              image: NetworkImage(result[index].image),
                              height: size.height * 0.40,
                              width: size.width * 0.30,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
      );
    } else {
      return const Text('no medcine');
    }
  }
}
