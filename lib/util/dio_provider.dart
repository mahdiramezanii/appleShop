import 'package:apple_shop/util/auth_manager.dart';
import 'package:dio/dio.dart';

class DioProvider {
  Dio crateDio() {
    Dio dio =
        Dio(BaseOptions(baseUrl: "https://startflutter.ir/api/", headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${AuthManager.get_token()}"
    }));

    return dio;
  }
}
