import 'package:apple_shop/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProductCategoryState {}

class InitProductCategoryState extends ProductCategoryState {}

class LoadingProductCategoeyState extends ProductCategoryState {}

class ResultProductCategoeyState extends ProductCategoryState {
  Either<String, List<Product>> product;

  ResultProductCategoeyState({
    required this.product,
  });
}
