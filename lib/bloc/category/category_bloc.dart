import 'package:apple_shop/bloc/category/category_event.dart';
import 'package:apple_shop/bloc/category/category_state.dart';
import 'package:apple_shop/data/repository/category_repository.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepository categoryRep=locator.get();
  CategoryBloc() : super(InitCategoryState()) {
    on<GetCategoryEvent>((event, emit) async {
      emit(LoadDataCategoryState());
      var response= await categoryRep.getCategoryItem();
      emit(ResponseCategoryState(response: response));
    });
  }
}
