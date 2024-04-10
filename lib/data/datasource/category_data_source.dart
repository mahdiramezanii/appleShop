import 'package:apple_shop/data/models/categori_model.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class ICategoryDataSource {
  Future<List<Category>> getCategoryList();
}

class CategoryData extends ICategoryDataSource {
  final Dio _dio = locator.get();

  @override
  Future<List<Category>> getCategoryList() async {
    try {
      var response = await _dio.get("collections/category/records");

       return response.data["items"]
          .map<Category>((jsonObject) => Category.fromJson(jsonObject))
          .toList();

     
    } on DioException catch (ex) {
      throw ApiExceptiopn(
          code: ex.response!.statusCode!,
          messgae: ex.response!.data["message"]);
    } catch (ex) {
  
      throw ApiExceptiopn(code: 0, messgae: "خطا محتوای متنی ندارد");
    }
  }
}
