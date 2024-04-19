import 'package:apple_shop/data/datasource/product_detail_datasource.dart';
import 'package:apple_shop/data/models/product_gallery_model.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dartz/dartz.dart';

abstract class IProductDetailRespotory {
  Future<Either<String, List<PruductGallery>>> getProductGalleryImage();
}

class ProductDetailRepository extends IProductDetailRespotory {
  final IProductDetailDataSource _productData = locator.get();

  @override
  Future<Either<String, List<PruductGallery>>> getProductGalleryImage() async {
    try {
      var response = await _productData.getProductGalleryImage();

      return Right(response);
    } on ApiExceptiopn catch (ex) {
      return Left(ex.messgae);
    }
  }
}
