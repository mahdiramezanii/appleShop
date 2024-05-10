
abstract class CommentEvent {}

class GetCommntsEvent extends CommentEvent {
  String productId;

  GetCommntsEvent({
    required this.productId,
  });
}

class SendCommentEvent extends CommentEvent {
  String productId;
  String comment;

  SendCommentEvent({
    required this.productId,
    required this.comment,
  });
}
