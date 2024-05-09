import 'dart:io';

import 'package:apple_shop/data/models/comments_models.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class ICommentDataSource {
  Future<List<Comments>> getComments(String productId);
}

class CommentRemoteDataSource extends ICommentDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<Comments>> getComments(String productId) async {
    try {
      Map<String, String> qparam = {"filter": 'product_id="$productId"'};

      var response = await _dio.get(
        "collections/comment/records",
        queryParameters: qparam,
      );

      return response.data["items"].map((jsonMapObject) {
        return Comments.fromJson(jsonMapObject);
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
