import 'package:apple_shop/data/models/categori_model.dart';
import 'package:apple_shop/data/models/product_gallery_model.dart';
import 'package:apple_shop/data/models/product_properties.dart';
import 'package:apple_shop/data/models/product_varibent.dart';
import 'package:dartz/dartz.dart';

abstract class ProductState {}

class ProductDetailIinitState extends ProductState {}

class ProductDetailLoadingState extends ProductState {}

class ProductDetailResultState extends ProductState {
  Either<String, List<PruductGallery>> product_image_list;
  Either<String, List<ProductVaribent>> productVaribent;
  Either<String, Category> getCategory;
  Either<String, List<Properties>> getProperties;

  ProductDetailResultState({
    required this.product_image_list,
    required this.productVaribent,
    required this.getCategory,
    required this.getProperties,
  });
}
