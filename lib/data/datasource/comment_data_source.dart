import 'dart:io';

import 'package:apple_shop/data/models/comments_models.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:apple_shop/util/auth_manager.dart';
import 'package:dio/dio.dart';

abstract class ICommentDataSource {
  Future<List<Comments>> getComments(String productId);
  Future<void> sendComment(String productId, String comment);
}

class CommentRemoteDataSource extends ICommentDataSource {
  final Dio _dio = locator.get();
  String user_id=AuthManager.getUserID();

  @override
  Future<List<Comments>> getComments(String productId) async {
    try {
      Map<String, String> qparam = {
        "filter": 'product_id="$productId"',
        "expand": "user_id"
      };

      var response = await _dio.get(
        "collections/comment/records",
        queryParameters: qparam,
      );

      return response.data["items"].map<Comments>((jsonMapObject) {
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

  @override
  Future<void> sendComment(String productId, String comment) async {
    try {
      var response = await _dio.post("collections/comment/records", data: {
        "product_id": productId,
        "text": comment,
        "user_id": user_id,
      });
    } on DioException catch (ex) {
      throw ApiExceptiopn(
        code: ex.response!.statusCode!,
        messgae: ex.response!.data["message"],
      );
    } catch (ex) {
      throw ApiExceptiopn(code: 0, messgae: "خطا محتوای متنی ندارد");
    }
  }
}
