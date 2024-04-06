import 'package:apple_shop/data/models/banner_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeState {}

class InitHomeState extends HomeState {}

class LodingBannerHomeState extends HomeState {}

class ResponseBannerHomeState extends HomeState {
  Either<String, List<BannerModel>> response;
  ResponseBannerHomeState({required this.response});
}
