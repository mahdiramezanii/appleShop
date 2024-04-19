import 'package:apple_shop/data/models/product_gallery_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProductState {}

class ProductDetailIinitState extends ProductState {}

class ProductDetailLoadingState extends ProductState {}

class ProductDetailResultState extends ProductState {
  Either<String, List<PruductGallery>> product_image_list;

  ProductDetailResultState({required this.product_image_list});
}
