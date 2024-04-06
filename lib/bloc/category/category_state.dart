import 'package:apple_shop/data/models/categori_model.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryState {}

class InitCategoryState extends CategoryState {}

class LoadDataCategoryState extends CategoryState{

}

class ResponseCategoryState extends CategoryState{

  Either<String,List<Category>> response;
  ResponseCategoryState({required this.response});
}
