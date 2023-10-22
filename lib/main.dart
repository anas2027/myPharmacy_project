// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/feature/auth/presention/get_x/auth_binding.dart';
import 'package:pharmcy_app/feature/drawer/presntion/get_x/dashboard_getx/dashboard_binding.dart';
import 'package:pharmcy_app/feature/drawer/presntion/get_x/recive_order_getx/recive_order_binding.dart';
import 'package:pharmcy_app/feature/drawer/presntion/get_x/user_order_recive_detail_getx/user_order_recive_detail_binding.dart';
import 'package:pharmcy_app/feature/drawer/presntion/get_x/user_order_recive_getx/user_order_recive_binding.dart';
import 'package:pharmcy_app/feature/drawer/presntion/page/dashboard_page.dart';
import 'package:pharmcy_app/feature/drawer/presntion/page/my_order_page.dart';
import 'package:pharmcy_app/feature/drawer/presntion/page/order_descrption_page.dart';
import 'package:pharmcy_app/feature/drawer/presntion/page/user_order/user_order_recive_detail_page.dart';
import 'package:pharmcy_app/feature/drawer/presntion/page/user_order/user_order_recive_page.dart';
import 'package:pharmcy_app/feature/drawer/presntion/page/walletPage.dart';
import 'package:pharmcy_app/feature/home_page/presention/get_x/addmedcinetocart_getx/addmedcinetocart_binding.dart';
import 'package:pharmcy_app/feature/home_page/presention/get_x/alert_getx/alert_binding.dart';
import 'package:pharmcy_app/feature/home_page/presention/get_x/cart_getx/cart_binding.dart';
import 'package:pharmcy_app/feature/home_page/presention/get_x/home_page/home_page_binding.dart';
import 'package:pharmcy_app/feature/home_page/presention/get_x/warehouse_medcine/warehous_medcine_binding.dart';
import 'package:pharmcy_app/feature/home_page/presention/page/alertpage.dart';
import 'package:pharmcy_app/feature/home_page/presention/page/cart_page.dart';
import 'package:pharmcy_app/feature/home_page/presention/page/home_page.dart';
import 'package:pharmcy_app/feature/home_page/presention/page/warehouse_medcine.dart';
import 'package:pharmcy_app/feature/mdecine_page/presention/getx_medcine_feature/my_medcine_binding.dart';
import 'package:pharmcy_app/feature/mdecine_page/presention/page_medcine_feature/my_medcine_page.dart';
import 'package:pharmcy_app/feature/product_page/presntion/getx_product_feature/add_product/add_product_binding.dart';
import 'package:pharmcy_app/feature/product_page/presntion/getx_product_feature/edit_product/edit_product_binding.dart';
import 'package:pharmcy_app/feature/product_page/presntion/getx_product_feature/my_product_binding.dart';
import 'package:pharmcy_app/feature/product_page/presntion/page_product_feature/add_product-page.dart';
import 'package:pharmcy_app/feature/product_page/presntion/page_product_feature/edit_product-page.dart';
import 'package:pharmcy_app/feature/product_page/presntion/page_product_feature/my_product_page.dart';
import 'core/colors/colors.dart';
import 'feature/auth/presention/page/login_page.dart';
import 'feature/drawer/presntion/get_x/recive_descrption_order_getx/binding_descrption_order.dart';
import 'feature/drawer/presntion/get_x/wallet_get_x/wallet_binding.dart';
import 'feature/drawer/presntion/page/edit_order_page.dart';
import 'feature/home_page/presention/page/add_medcine_to_cart.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late MyColors colors = MyColors();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
            appBarTheme:
                AppBarTheme(backgroundColor: colors.appbar, centerTitle: true)),
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/', page: (() => Register()), binding: AuthBinding()),
          GetPage(
              name: '/homePage',
              page: (() => HomePageScreen()),
              binding: HomePageBindings()),
          GetPage(
              name: '/MyMedcinePage',
              page: () => MyMedcinePage(),
              binding: MyMedcineBinding()),
          GetPage(
              name: '/MyProduct',
              page: () => MyProductPage(),
              binding: MyProductBinding()),
          GetPage(
              name: '/warehouseMedcine',
              page: () => WarehouseMedcinePage(),
              binding: WarehouseMedcineBinding()),
          GetPage(
              name: '/EditProductpage',
              page: () => EditProductPage(),
              binding: EditProductBinding()),
          GetPage(
              name: '/AddProduct',
              page: () => AddProductPage(),
              binding: AddProductBinding()),
          GetPage(
              name: '/cartpage',
              page: () => CartPage(),
              binding: CartBinding()),
          GetPage(
              name: '/AddMedcineToCart',
              page: () => AddMedcineToCart(),
              binding: AddmedcinetocartBinding()),
          GetPage(
              name: '/Wallet',
              page: () => WalletPage(),
              binding: WalletBinding()),
          GetPage(
              name: '/myorder',
              page: () => MyOrderpage(),
              binding: ReciveOrderBinding()),
          GetPage(
              name: '/myorderdescrption',
              page: () => MyOrderDescrptionpage(),
              binding: OrderDescrptionBinding()),
          GetPage(
              name: '/addnewmedtoyourcart',
              page: () => AddNewMedcineToCart(),
              binding: WarehouseMedcineBinding()),
          GetPage(
              name: '/alert', page: () => AlertPage(), binding: AlertBinding()),
          GetPage(
              name: '/DashBoard',
              page: () => DashboardPage(),
              binding: DashBoardBinding()),
          GetPage(
              name: '/userorder',
              page: () => UserOrderRecivePage(),
              binding: UserOrderReciveBinding()),
          GetPage(
              name: '/userorderdetail',
              page: () => UserOrderReciveDetailPage(),
              binding: UserOrderReciveDetailBinding())
        ]);
  }
}
