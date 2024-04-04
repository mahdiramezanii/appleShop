import 'package:apple_shop/data/datasource/authentication_datasource.dart';
import 'package:apple_shop/data/repository/authentication_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.I;
Future<void> initLocator() async {
  locator.registerSingleton<Dio>(Dio(
    BaseOptions(baseUrl: "https://startflutter.ir/api/"),
  ));

  //Data Resource

  locator.registerFactory<IAuthenticationDataSource>(
      () => AuthenticationDataSource());


  //Repository Resource 

  locator.registerFactory<IAuthenticatinRepository>(() => AuthenticatinRepository());
}
