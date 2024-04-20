import 'package:apple_shop/data/models/product_gallery_model.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class IProductDetailDataSource {
  Future<List<PruductGallery>> getProductGalleryImage(String product_id);
}

class ProductDetailRemoteDatatSource extends IProductDetailDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<PruductGallery>> getProductGalleryImage(String product_id) async {
    try {
      Map<String, String> qparam = {"filter": 'product_id="$product_id"'};
      var response = await _dio.get("collections/gallery/records",queryParameters: qparam);
      

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
