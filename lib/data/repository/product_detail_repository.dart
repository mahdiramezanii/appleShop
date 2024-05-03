import 'package:apple_shop/data/datasource/product_detail_datasource.dart';
import 'package:apple_shop/data/models/categori_model.dart';
import 'package:apple_shop/data/models/product_gallery_model.dart';
import 'package:apple_shop/data/models/product_varibent.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dartz/dartz.dart';

abstract class IProductDetailRespotory {
  Future<Either<String, List<PruductGallery>>> getProductGalleryImage(
      String product_id);
  Future<Either<String, List<ProductVaribent>>> getProductVaribentList();
  Future<Either<String, Category>> getCategory(String category_id);
}

class ProductDetailRepository extends IProductDetailRespotory {
  final IProductDetailDataSource _productData = locator.get();

  @override
  Future<Either<String, List<PruductGallery>>> getProductGalleryImage(
      String product_id) async {
    try {
      var response = await _productData.getProductGalleryImage(product_id);

      return Right(response);
    } on ApiExceptiopn catch (ex) {
      return Left(ex.messgae);
    }
  }

  @override
  Future<Either<String, List<ProductVaribent>>> getProductVaribentList() async {
    try {
      var response = await _productData.getProductVaribentListt();

      return Right(response);
    } on ApiExceptiopn catch (ex) {
      return Left(ex.messgae);
    }
  }

  @override
  Future<Either<String, Category>> getCategory(category_id) async {
    try {
      var response = await _productData.getCategory(category_id);

      return Right(response);
    } on ApiExceptiopn catch (ex) {
      return Left(ex.messgae);
    }
  }
}
