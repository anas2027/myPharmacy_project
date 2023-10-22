// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/constant/constants.dart';
import '../get_x/wallet_get_x/wallet_conntroller.dart';

class WalletPage extends StatelessWidget {
  WalletController controller = Get.find();
  late MyColors colors = MyColors();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Get.offAllNamed('/homePage');
        }, icon: Icon(Icons.arrow_back)),
        backgroundColor: colors.appbar,
        centerTitle: true,
        title: Text(
          'My Wallet ',
          style: TextStyle(color: colors.textcolors),
        ),
      ),
      body: GetBuilder<WalletController>(builder: (controller) {
        if (controller.wallet.funds >=1) {
          return RefreshIndicator(
            onRefresh: () {
              return controller.getPharmcyWallet();
            },
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: size.height * 0.8,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Image(
                            image: const AssetImage('assests/image/wallet.png'),
                            height: size.height * 0.3,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(35),
                          child: TextDefault(
                              maxLine: 2,
                              colorText: colors.textcolors,
                              fontWeight: FontWeight.bold,
                              fontsize: 30,
                              textOverflow: TextOverflow.clip,
                              contentText:
                                  'Your Balance Is : ${controller.wallet.funds} \$'),
                        ),
                      ]),
                ),
              ],
            ),
          );
        } else {
          return controller.isloading
              ? Center(
                  child: CircularProgressIndicator(
                  color: colors.textcolors,
                ))
              : Center(
                  child: TextDefault(
                    colorText: colors.textcolors,
                    contentText: 'your balance is 0 :(',
                    fontWeight: FontWeight.bold,
                    fontsize: 40,
                    maxLine: 1,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                );
        }
      }),
    );
  }
}
