import 'package:apple_shop/data/models/categori_model.dart';
import 'package:apple_shop/data/models/product_gallery_model.dart';
import 'package:apple_shop/data/models/product_varibent.dart';
import 'package:apple_shop/data/models/varibent_model.dart';
import 'package:apple_shop/data/models/varient_type_model.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class IProductDetailDataSource {
  Future<List<PruductGallery>> getProductGalleryImage(String product_id);
  Future<List<Varibent>> getVaribent();
  Future<List<VarientType>> getVaribentType();
  Future<List<ProductVaribent>> getProductVaribentListt();
  Future<Category> getCategory(String category_id);
}

class ProductDetailRemoteDatatSource extends IProductDetailDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<PruductGallery>> getProductGalleryImage(String product_id) async {
    try {
      Map<String, String> qparam = {"filter": 'product_id="$product_id"'};
      var response = await _dio.get("collections/gallery/records",
          queryParameters: qparam);

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

  @override
  Future<List<Varibent>> getVaribent() async {
    try {
      Map<String, String> qparam = {"filter": 'product_id="at0y1gm0t65j62j"'};

      var response = await _dio.get("collections/variants/records",
          queryParameters: qparam);

      return response.data["items"].map<Varibent>((jsonMapObject) {
        return Varibent.fromJson(jsonMapObject);
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

  @override
  Future<List<VarientType>> getVaribentType() async {
    try {
      var response = await _dio.get("collections/variants_type/records");

      return response.data["items"].map<VarientType>((jsonMapObject) {
        return VarientType.fromJson(jsonMapObject);
      }).toList();
    } on DioException catch (ex) {
      throw ApiExceptiopn(
        code: ex.response!.statusCode!,
        messgae: ex.response!.data["items"],
      );
    } catch (ex) {
      throw ApiExceptiopn(
        code: 0,
        messgae: "خطا محتوای متنی ندارد",
      );
    }
  }

  @override
  Future<List<ProductVaribent>> getProductVaribentListt() async {
    List<Varibent> varibent_list = await getVaribent();
    List<VarientType> varibent_type = await getVaribentType();
    List<ProductVaribent> product_varibent = [];

    for (var type in varibent_type) {
      var response = varibent_list.where((element) {
        return element.type_id == type.id;
      }).toList();

      product_varibent.add(ProductVaribent(
        varibent_list: response,
        varibent_type: type,
      ));
    }

    return product_varibent;
  }

  @override
  Future<Category> getCategory(String category_id) async {
    Map<String, String> qparam = {"filter": '"id=${category_id}"'};

    try {
      var response = await _dio.get(
        "collections/category/records",
        queryParameters: qparam,
      );

      return Category.fromJson(response.data["items"][0]);
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
