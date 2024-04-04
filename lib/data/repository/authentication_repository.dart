import "package:apple_shop/data/datasource/authentication_datasource.dart";
import "package:apple_shop/di/service_locator.dart";
import "package:apple_shop/util/api_exception.dart";
import "package:dartz/dartz.dart";

abstract class IAuthenticatinRepository {
  Future<Either<String, String>> register();
}

class AuthenticatinRepository implements IAuthenticatinRepository {
  IAuthenticationDataSource iauth = locator.get();

  @override
  Future<Either<String, String>> register() async {
    try {
      await iauth.registerUser("mahdghgshgdhi", "12345678", "12345678");
      return const Right("ثبت نام با موفقیت انجام شد");
    } on ApiExceptiopn catch (ex) {
      return const Left("ثبت نام انجام نشد");
    }
  }
}
