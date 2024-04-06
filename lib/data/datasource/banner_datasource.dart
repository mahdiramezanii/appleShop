import 'package:apple_shop/data/models/banner_model.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class IBannerDataSource {
  Future<List<BannerModel>> getBanner();
}

class BannerRemoteDataSource extends IBannerDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<BannerModel>> getBanner() async {
    try {
      var response = await _dio.get("collections/banner/records");

      return response.data["items"]
          .map<BannerModel>((jsonObject) => BannerModel.fromJson(jsonObject))
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
