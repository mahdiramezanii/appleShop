import 'package:apple_shop/data/models/product_model.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class IProductDataSource {
  Future<List<Product>> getProduct();
}

class ProductRemoteDataSource extends IProductDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<Product>> getProduct() async {
    try {
      var response = await _dio.get("collections/products/records");

      return response.data["items"]
          .map<Product>((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiExceptiopn(
        code: ex.response!.statusCode!,
        messgae: ex.response!.data["message"],
      );
    } catch (ex) {
      throw ApiExceptiopn(code: 0, messgae: "خطای ناشناخته");
    }
  }
}
