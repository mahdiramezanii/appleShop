import 'package:apple_shop/data/models/product_model.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class IProductDataSource {
  Future<List<Product>> getProduct();
  Future<List<Product>> getHotestProduct();
  Future<List<Product>> getMostSeller();
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

  @override
  Future<List<Product>> getHotestProduct() async {
    try {
      Map<String, String> qparam = {
        "filter": "popularity=Hotest",
      };
      var response = await _dio.get("collections/products/records",
          queryParameters: qparam);

      return response.data["items"].map<Product>((jsonObject) {
        return Product.fromJson(jsonObject);
      }).toList();
    } on DioException catch (ex) {
      throw ApiExceptiopn(
        code: ex.response!.statusCode!,
        messgae: ex.response!.data["message"],
      );
    }
  }

  @override
  Future<List<Product>> getMostSeller() async {
    try {
      Map<String, String> qparam = {
        "filter": "popularity=Hotest",
      };
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
      throw ApiExceptiopn(code: 0, messgae: "حطای ناشناخته");
    }
  }
}
