import 'package:apple_shop/data/models/product_gallery_model.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class IProductDetailDataSource {
  Future<List<PruductGallery>> getProductGalleryImage();
}

class ProductDetailRemoteDatatSource extends IProductDetailDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<PruductGallery>> getProductGalleryImage() async {
    try {
      var response = await _dio.get("collections/gallery/records");

      return response.data["items"].map<PruductGallery>((jsonMapObject) {
        return PruductGallery.fromJson(jsonMapObject);
      }).toList();
    } on DioException catch (ex) {
      throw ApiExceptiopn(
        code: ex.response!.statusCode!,
        messgae: ex.response!.data["message"],
      );
    } catch (ex) {
      throw ApiExceptiopn(
        code: 0,
        messgae: "خطا محتوای متنی ندارد",
      );
    }
  }
}
