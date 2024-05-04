import 'package:apple_shop/data/datasource/product_category_data_source.dart';
import 'package:apple_shop/data/models/product_model.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dartz/dartz.dart';

abstract class IProductCategoryRepostory {
  Future<Either<String, List<Product>>> category_product(String categoryId);
}

class ProductCategoryRepository extends IProductCategoryRepostory {
  IProductCategoryDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<Product>>> category_product(
      String categoryId) async {
    try {
      var response = await _dataSource.category_product(categoryId);

      return Right(response);
    } on ApiExceptiopn catch (ex) {
      return Left(ex.messgae);
    }
  }
}
