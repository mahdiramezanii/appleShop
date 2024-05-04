import 'package:apple_shop/bloc/category_product/category_product_event.dart';
import 'package:apple_shop/bloc/category_product/category_product_state.dart';
import 'package:apple_shop/data/repository/product_category_repository.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCategoryBloc
    extends Bloc<ProductCategoryEvent, ProductCategoryState> {
  ProductCategoryBloc() : super(LoadingProductCategoeyState()) {
    IProductCategoryRepostory _repository = locator.get();

    on<GetProductCategoryEvent>((event, emit) async {
      var product = await _repository.category_product(event.categoryId);
      emit(ResultProductCategoeyState(product: product));
    });
  }
}
