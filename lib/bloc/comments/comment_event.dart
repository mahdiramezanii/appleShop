abstract class CommentEvent {}

class GetCommntsEvent extends CommentEvent {
  String productId;

  GetCommntsEvent({
    required this.productId,
  });
}
