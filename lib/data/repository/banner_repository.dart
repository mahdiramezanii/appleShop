import 'package:apple_shop/data/datasource/banner_datasource.dart';
import 'package:apple_shop/data/models/banner_model.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dartz/dartz.dart';

abstract class IBannerRepository {
  Future<Either<String, List<BannerModel>>> getBanner();
}

class BannerRemoteRepository extends IBannerRepository {
  // ignore: non_constant_identifier_names
  final IBannerDataSource _banner_remote = locator.get();
  @override
  Future<Either<String, List<BannerModel>>> getBanner() async {
    try {
      var response = await _banner_remote.getBanner();

      return Right(response);
    } on ApiExceptiopn catch (ex) {
      return Left(ex.messgae);
    } catch (ex) {
      return const Left("خطای غیرمنتظره");
    }
  }
}
