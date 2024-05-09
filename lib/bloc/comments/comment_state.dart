import 'package:apple_shop/data/models/comments_models.dart';
import 'package:dartz/dartz.dart';

abstract class CommentState {}

class InitialCommentState extends CommentState {}

class LoadingCommentsState extends CommentState {}

class ResponseCommentState extends CommentState {
  Either<String, List<Comments>> response;

  ResponseCommentState({
    required this.response,
  });
}
