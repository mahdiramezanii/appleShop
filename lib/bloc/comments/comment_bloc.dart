import 'package:apple_shop/bloc/comments/comment_event.dart';
import 'package:apple_shop/bloc/comments/comment_state.dart';
import 'package:apple_shop/data/repository/comments_reository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final ICommentsRepository _repository;

  CommentBloc(this._repository) : super(InitialCommentState()) {
    on<GetCommntsEvent>((event, emit) async {
      emit(LoadingCommentsState());
      var response = await _repository.getComments(event.productId);

      emit(ResponseCommentState(response: response));
    });
  }
}
