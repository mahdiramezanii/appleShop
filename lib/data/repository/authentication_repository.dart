import "package:apple_shop/data/datasource/authentication_datasource.dart";
import "package:apple_shop/di/service_locator.dart";
import "package:apple_shop/util/api_exception.dart";
import "package:apple_shop/util/auth_manager.dart";
import "package:dartz/dartz.dart";
import "package:shared_preferences/shared_preferences.dart";

//http://startflutter.ir/api/collections/users/auth-with-password
abstract class IAuthenticatinRepository {
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm);
  Future<Either<String, String>> login(String username, String password);
}

class AuthenticatinRepository implements IAuthenticatinRepository {
  IAuthenticationDataSource iauth = locator.get();

  @override
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm) async {
    try {
      await iauth.registerUser(username, password, passwordConfirm);
      return const Right("ثبت نام با موفقیت انجام شد");
    } on ApiExceptiopn catch (ex) {
      return Left(ex.messgae);
    }
  }

  @override
  Future<Either<String, String>> login(String username, String password) async {
    try {
      String token = await iauth.login(username, password);

      if (token.isNotEmpty) {
      
        return Right("لاگین انجام شد");
      } else {
        return const Left("خطا");
      }
    } on ApiExceptiopn catch (ex) {
      return Left("${ex.messgae}");
    } catch (ex) {
      return const Left("خطا در هنگام ثبت نام");
    }
  }
}
