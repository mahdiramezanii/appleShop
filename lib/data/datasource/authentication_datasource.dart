import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

abstract class IAuthenticationDataSource {
  Future<void> registerUser(
      String username, String password, String passwordConfirm);

  Future<String> login(String username, String password);
}

class AuthenticationDataSource implements IAuthenticationDataSource {
  final _dio = GetIt.I.get<Dio>();

  @override
  Future<void> registerUser(
    String username,
    String password,
    String passwordConfirm,
  ) async {
    try {
      var response = await _dio.post("collections/users/records", data: {
        "username": username,
        "password": password,
        "passwordConfirm": passwordConfirm,
      });
    } on DioException catch (ex) {
      throw ApiExceptiopn(
        code: ex.response!.statusCode!,
        messgae: ex.response!.data["message"],
      );
    } catch (ex) {
      throw ApiExceptiopn(code: 0, messgae: "Erorr");
    }
  }

  @override
  Future<String> login(String username, String password) async {
    try {
      var response = await _dio.post("collections/users/auth-with-password",
          data: {"identity": username, "password": password});

      if (response.statusCode == 200) {
        return response.data["token"];
      }
      else{
        return "";
      }
    } on DioException catch (ex) {
      throw ApiExceptiopn(
          code: ex.response!.statusCode!,
          messgae: ex.response?.data["message"]);
    } catch (ex) {
      throw ApiExceptiopn(code: 0, messgae: "Erorr");
    }
  }
}
