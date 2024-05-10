import 'package:apple_shop/data/datasource/comment_data_source.dart';
import 'package:apple_shop/data/models/comments_models.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dartz/dartz.dart';

abstract class ICommentsRepository {
  Future<Either<String, List<Comments>>> getComments(String productId);
  Future<Either<String, String>> sendComment(String productId, String comment);
}

class CommenstRepository extends ICommentsRepository {
  ICommentDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<Comments>>> getComments(String productId) async {
    try {
      var response = await _dataSource.getComments(productId);
      return Right(response);
    } on ApiExceptiopn catch (ex) {
      return Left(ex.messgae);
    }
  }

  @override
  Future<Either<String, String>> sendComment(
      String productId, String comment) async {
    try {
      var response = await _dataSource.sendComment(productId, comment);

      return const Right("کامنت با موفقیت ارسال شد");
    } on ApiExceptiopn catch (ex) {
      return Left(ex.messgae);
    }
  }
}
