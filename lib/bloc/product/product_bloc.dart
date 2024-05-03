import 'package:apple_shop/bloc/product/product_event.dart';
import 'package:apple_shop/bloc/product/product_state.dart';
import 'package:apple_shop/data/repository/product_detail_repository.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductDetailRespotory _productRepository = locator.get();

  ProductBloc() : super(ProductDetailIinitState()) {
    on<InitialProductDetailEvent>((event, emit) async {
      emit(ProductDetailLoadingState());
      var response =
          await _productRepository.getProductGalleryImage(event.product_id);
      var product_varibent = await _productRepository.getProductVaribentList();
      var category = await _productRepository.getCategory(event.category_id);
      emit(ProductDetailResultState(
        product_image_list: response,
        productVaribent: product_varibent,
        getCategory: category,
      ));
    });
  }
}
