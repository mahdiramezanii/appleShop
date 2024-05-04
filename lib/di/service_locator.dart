import 'package:apple_shop/data/datasource/authentication_datasource.dart';
import 'package:apple_shop/data/datasource/banner_datasource.dart';
import 'package:apple_shop/data/datasource/product_category_data_source.dart';
import 'package:apple_shop/data/datasource/product_detail_datasource.dart';
import 'package:apple_shop/data/repository/banner_repository.dart';
import 'package:apple_shop/data/datasource/category_data_source.dart';
import 'package:apple_shop/data/datasource/product_data_source.dart';
import 'package:apple_shop/data/repository/authentication_repository.dart';
import 'package:apple_shop/data/repository/category_repository.dart';
import 'package:apple_shop/data/repository/product_category_repository.dart';
import 'package:apple_shop/data/repository/product_detail_repository.dart';
import 'package:apple_shop/data/repository/product_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.I;
Future<void> initLocator() async {
  locator.registerSingleton<Dio>(Dio(
    BaseOptions(baseUrl: "https://startflutter.ir/api/"),
  ));

  //Data Resource
  locator.registerFactory<IAuthenticationDataSource>(
      () => AuthenticationDataSource());

  locator.registerFactory<ICategoryDataSource>(() => CategoryData());
  locator.registerFactory<IBannerDataSource>(() => BannerRemoteDataSource());
  locator.registerSingleton<IProductDataSource>(ProductRemoteDataSource());
  locator.registerFactory<IProductDetailDataSource>(() {
    return ProductDetailRemoteDatatSource();
  });

  locator.registerFactory<IProductCategoryDataSource>(() => ProductCategoryDataSource());

  //Repository Resource
  locator.registerFactory<IAuthenticatinRepository>(
      () => AuthenticatinRepository());
  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());
  locator.registerFactory<IBannerRepository>(() => BannerRemoteRepository());
  locator.registerFactory<IProductRepository>(() => ProductRemoteRepository());
  locator.registerFactory<IProductDetailRespotory>(() => ProductDetailRepository());
  locator.registerFactory<IProductCategoryRepostory>(() => ProductCategoryRepository());
  //components
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
}
