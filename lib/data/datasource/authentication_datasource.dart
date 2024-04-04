import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class AuthenticationDataSource {
  final _dio = GetIt.I.get<Dio>();

  Future<void> registerUser(
      String username, String password, String passwordConfirm) async {
    try {
      var response = await _dio.post("collections/users/records", data: {
        "username": username,
        "password": password,
        "passwordConfirm": passwordConfirm,
      });
      print(response.statusCode);
    } on DioException catch (ex) {
      print(ex.message);
      print(ex.response?.data);
    } catch (ex) {
      print("خظا");
    }
  }
}
