import 'package:apple_shop/data/models/product_model.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class IProductCategoryDataSource {
  Future<List<Product>> category_product(String categoryId);
}

class ProductCategoryDataSource extends IProductCategoryDataSource {
  Dio _dio = locator.get();

  @override
  Future<List<Product>> category_product(String categoryId) async {
    try {
      Map<String, String> qparam = {"filter": 'category="${categoryId}"'};
      var response = await _dio.get(
        "collections/products/records",
        queryParameters: qparam,
      );

      return response.data["items"].map<Product>((jsonObject) {
        return Product.fromJson(jsonObject);
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
