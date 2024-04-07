import 'package:apple_shop/data/models/banner_model.dart';
import 'package:apple_shop/data/models/categori_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeState {}

class InitHomeState extends HomeState {}

class LodingBannerHomeState extends HomeState {}

class ResponseBannerHomeState extends HomeState {
  Either<String, List<BannerModel>> response;
  Either<String, List<Category>> categoryRespnse;
  ResponseBannerHomeState(
      {required this.response, required this.categoryRespnse});
}
