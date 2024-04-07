import 'package:apple_shop/bloc/home/home_event.dart';
import 'package:apple_shop/bloc/home/home_state.dart';
import 'package:apple_shop/data/repository/banner_repository.dart';
import 'package:apple_shop/data/repository/category_repository.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRemote = locator.get();
  final ICategoryRepository _category = locator.get();
  HomeBloc() : super(InitHomeState()) {
    on<GetBannerHomeEvent>((event, emit) async {
      emit(LodingBannerHomeState());
      var response = await _bannerRemote.getBanner();
      var categoryRespnse = await _category.getCategoryItem();

      emit(ResponseBannerHomeState(
          response: response, categoryRespnse: categoryRespnse));
    });
  }
}
