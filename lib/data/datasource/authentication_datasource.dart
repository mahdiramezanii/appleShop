import 'package:apple_shop/util/api_exception.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

abstract class IAuthenticationDataSource {
  Future<void> registerUser(
      String username, String password, String passwordConfirm);
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
}
