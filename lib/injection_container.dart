import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pharmcy_app/feature/auth/data/datasource/remote_data_source.dart';
import 'package:pharmcy_app/feature/auth/data/repositry/auth_implment_repositry.dart';
import 'package:pharmcy_app/feature/auth/domain/repositry/authrepositry.dart';
import 'package:pharmcy_app/feature/drawer/data/drawer_remote_data_source/drawer_remote_data_source.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_repo/drawer_repoitry.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/cansle_confirm_order_usecase.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/confirm_order_usecase.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/confirm_user_med_order-detail.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/delete_order_detail_usecase.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/get_most_medcine_sell_usecase.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/get_order_descrption_usecase.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/get_order_usecase.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_usecase/get_rachita_usecase.dart';
import 'package:pharmcy_app/feature/home_page/data/datasource/home_remote_data_source.dart';
import 'package:pharmcy_app/feature/home_page/data/repositry/home_implment_repositry.dart';
import 'package:pharmcy_app/feature/home_page/domain/repositry/home_repositry.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/add_medcine_to_order_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/cart_confirm_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/create_order.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/delete_order.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/getWarehouseMedcinebyCategor_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/get_category_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/get_chemical_composition_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/get_empty_medcine_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/get_medcine_abouttoexpierd_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/get_my_medcine.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/get_totalprice_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/get_warehouse_bycategory_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/get_warehouses_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/getwarehouse_bycity_usecase.dart';
import 'package:pharmcy_app/feature/home_page/domain/usecase/getwarehousebyid_usecase.dart';
import 'package:pharmcy_app/feature/mdecine_page/data/my_medcine_repo_impl/my_medcine_repo_impl.dart';
import 'package:pharmcy_app/feature/mdecine_page/data/remotedatasource/remote_data_source.dart';
import 'package:pharmcy_app/feature/mdecine_page/domain/repositry/medcine_repositry.dart';
import 'package:pharmcy_app/feature/mdecine_page/domain/usecase/delete_medcine_usecase.dart';
import 'package:pharmcy_app/feature/mdecine_page/domain/usecase/get_medcine_by_category_usecae.dart';
import 'package:pharmcy_app/feature/mdecine_page/domain/usecase/get_my_medcine_usecase.dart';
import 'package:pharmcy_app/feature/product_page/data/datasource/remote_data_source.dart';
import 'package:pharmcy_app/feature/product_page/data/impl_repositry/repositry_impl.dart';
import 'package:pharmcy_app/feature/product_page/domain/repositry/product_repositry.dart';
import 'package:pharmcy_app/feature/product_page/domain/usecase/add_new_quantity_usecase.dart';
import 'package:pharmcy_app/feature/product_page/domain/usecase/add_product_usecase.dart';
import 'package:pharmcy_app/feature/product_page/domain/usecase/delete_new_qnatity_usecase.dart';
import 'package:pharmcy_app/feature/product_page/domain/usecase/delete_product_usecase.dart';
import 'package:pharmcy_app/feature/product_page/domain/usecase/edit_product_usecase.dart';
import 'package:pharmcy_app/feature/product_page/domain/usecase/get_product_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'error/network/network_info.dart';
import 'feature/auth/domain/usecase/login_use_case.dart';
import 'feature/drawer/data/drawer_repo_impl/drawer_repo_impl.dart';
import 'feature/drawer/domain/drawer_usecase/get-wallet_usecase.dart';
import 'feature/drawer/domain/drawer_usecase/get_user_medcine_order_detail.dart';
import 'feature/drawer/domain/drawer_usecase/get_user_order_usecase.dart';
import 'feature/drawer/domain/drawer_usecase/get_user_product_order_detail.dart';
import 'feature/home_page/domain/usecase/get_medcine_cart_usecase.dart';
import 'feature/mdecine_page/domain/usecase/delete_qunatity_medcine_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // usecase
  sl.registerLazySingleton(() => LoginUseCase(authRepositry: sl()));
  sl.registerLazySingleton(() => GetWarehouseUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(
      () => GetWarehouseMedcineUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => GetProductUseCase(productRepositry: sl()));
  sl.registerLazySingleton(() => EditproductUseCase(productRepositry: sl()));
  sl.registerLazySingleton(
      () => GetWarehouseMedcinebyCategorUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => GetWarehouseByCity(homeRepositry: sl()));

  sl.registerLazySingleton(() => AddproductUseCase(productRepositry: sl()));
  sl.registerLazySingleton(() => DeleteProductUsecase(productRepositry: sl()));
  sl.registerLazySingleton(() => DeleteNewQuantity(productRepositry: sl()));
  sl.registerLazySingleton(
      () => DeleteQuantityOfMedcine(medcineRepositry: sl()));

  sl.registerLazySingleton(() => GetMyMedcineUseCase(medcineRepositry: sl()));
    sl.registerLazySingleton(() => GetMedcineByCategoryUseCase(medcineRepositry: sl()));

  sl.registerLazySingleton(() => AddNewQuantityuseCase(productRepositry: sl()));
  sl.registerLazySingleton(() => CreateOrderUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => AddMedcineToOrderUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => GetWarehouseByIdUseCase(homeRepositry: sl()));
    sl.registerLazySingleton(() => GetRachetaImageUsecase(drawerRepositry: sl()));

  

  sl.registerLazySingleton(
      () => GetMedcineAboutToExpiredUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => GetEmptyMedcineUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(
      () => ConfrimUserOrderDetailUSeCase(drawerRepositry: sl()));
      sl.registerLazySingleton(
      () => DeleteMedcineUseCase(medcineRepositry: sl()));

  sl.registerLazySingleton(() => GetMedcineCartuseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => CartConfirmUsecase(homeRepositry: sl()));
  sl.registerLazySingleton(() => CategoryUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => GetWalletUseCase(drawerRepositry: sl()));
    sl.registerLazySingleton(() => MostMedcineSoldUseCase(drawerRepositry: sl()));

  
  sl.registerLazySingleton(() => DeleteOrderUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => GetOrderUsecase(drawerRepositry: sl()));
  sl.registerLazySingleton(() => GetUserOrderUseCase(drawerRepositry: sl()));

  sl.registerLazySingleton(
      () => GetUserMedcienOrderDetailUseCase(drawerRepositry: sl()));

  sl.registerLazySingleton(
      () => GetUserProductOrderDetailUseCase(drawerRepositry: sl()));

  sl.registerLazySingleton(
      () => CansleconfirmOrderUseCase(drawerRepositry: sl()));
  sl.registerLazySingleton(() => ConfirmOrderUseCase(drawerRepositry: sl()));

  sl.registerLazySingleton(
      () => GetorderDescrptionUseCase(drawerRepositry: sl()));
  sl.registerLazySingleton(() => GetWarehouseByCategory(homeRepositry: sl()));
  sl.registerLazySingleton(() => GetTotalPriceUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(
      () => DeleteOrderDetailUseCase(drawerRepositry: sl()));

  //Repositores
  sl.registerLazySingleton<AuthRepositry>(
      () => AuthRepositryImp(authRemoteDataSorce: sl(), networkInfo: sl()));
  sl.registerLazySingleton<HomeRepositry>(
      () => HomeRepositryImp(homeRemoteDataSorce: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ProductRepositry>(
      () => ProductRepoImpl(productRemoteDataSorce: sl(), networkInfo: sl()));
  sl.registerLazySingleton<MyMedcineRepositry>(() =>
      MyMedcineRepoImpl(myMedcineReomteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<DrawerRepositry>(
      () => DrawerRepoImpl(drawerRemoteDataSource: sl(), networkInfo: sl()));

  // Datasource
  sl.registerLazySingleton<AuthRemoteDataSorce>(
      () => AuthRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<HomeRemoteDataSorce>(
      () => HomeRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<ProoductRemoteDataSource>(
      () => ProductRemoteDataSorurceimpl(client: sl()));
  sl.registerLazySingleton<MyMedcineRemoteDataSource>(
      () => MyMedcineRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<DrawerRemoteDataSource>(
      () => DrawerRemoteDataSourceImpl(client: sl()));

//! core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
//External

//sharedPrefrence
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

//http

  sl.registerLazySingleton(() => http.Client());
  //internetconnectionchecker
  sl.registerLazySingleton(() => InternetConnectionChecker());
  // file
  sl.registerLazySingleton(() => File(''));
}
