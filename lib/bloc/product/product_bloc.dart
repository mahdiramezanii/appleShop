import 'package:apple_shop/bloc/product/product_event.dart';
import 'package:apple_shop/bloc/product/product_state.dart';
import 'package:apple_shop/data/datasource/busket_repository.dart';
import 'package:apple_shop/data/repository/product_detail_repository.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductDetailRespotory _productRepository = locator.get();
  final IBusketRepository _busketRepository = locator.get();

  ProductBloc() : super(ProductDetailIinitState()) {
    on<InitialProductDetailEvent>((event, emit) async {
      emit(ProductDetailLoadingState());
      var response =
          await _productRepository.getProductGalleryImage(event.product_id);
      var product_varibent =
          await _productRepository.getProductVaribentList(event.product_id);
      var category = await _productRepository.getCategory(event.category_id);
      var properties = await _productRepository.getProperties(event.product_id);

      emit(ProductDetailResultState(
        product_image_list: response,
        productVaribent: product_varibent,
        getCategory: category,
        getProperties: properties,
      ));
    });

    on<AddProductToBusket>((event, emit) async {
      await _busketRepository.addProductToBusket(event.product);
      print("sucsess");
    });
  }
}
