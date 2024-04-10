import 'package:apple_shop/data/datasource/product_data_source.dart';
import 'package:apple_shop/data/models/product_model.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dartz/dartz.dart';

abstract class IProductRepository {
  Future<Either<String, List<Product>>> getProduct();
}

class ProductRemoteRepository extends IProductRepository {
  final IProductDataSource product_data_source = locator.get();

  @override
  Future<Either<String, List<Product>>> getProduct() async {
    try {
      var response = await product_data_source.getProduct();

      return Right(response);
    } on ApiExceptiopn catch (e) {
      return Left(e.messgae);
    }
  }
}
