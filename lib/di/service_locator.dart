import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.I;
Future<void> initLocator() async {
  locator.registerSingleton<Dio>(Dio(
    BaseOptions(baseUrl: "https://startflutter.ir/api/"),
  ));
}
