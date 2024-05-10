import 'package:apple_shop/bloc/busket/busket_bloc.dart';
import 'package:apple_shop/data/datasource/authentication_datasource.dart';
import 'package:apple_shop/data/datasource/banner_datasource.dart';
import 'package:apple_shop/data/datasource/busket_datasource.dart';
import 'package:apple_shop/data/datasource/comment_data_source.dart';
import 'package:apple_shop/data/repository/busket_repository.dart';
import 'package:apple_shop/data/datasource/product_category_data_source.dart';
import 'package:apple_shop/data/datasource/product_detail_datasource.dart';
import 'package:apple_shop/data/repository/banner_repository.dart';
import 'package:apple_shop/data/datasource/category_data_source.dart';
import 'package:apple_shop/data/datasource/product_data_source.dart';
import 'package:apple_shop/data/repository/authentication_repository.dart';
import 'package:apple_shop/data/repository/category_repository.dart';
import 'package:apple_shop/data/repository/comments_reository.dart';
import 'package:apple_shop/data/repository/product_category_repository.dart';
import 'package:apple_shop/data/repository/product_detail_repository.dart';
import 'package:apple_shop/data/repository/product_repository.dart';
import 'package:apple_shop/util/payment_hamdler.dart';
import 'package:apple_shop/util/url_handller.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.I;
Future<void> initLocator() async {
//====================  Start Util ========================
  _initUtil();
//==================== End Util    ========================

//=================  Start DataSource  ==================

  _initDataSource();

//=================   End DataSource  ======================

//============   Repository Resource  =============

  _initRepository();

//============  End Repository Resource  ===========

//==============================   components    ===========================
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

//==============================   End components    ===========================

//=================== Start Bloc =======================

  _initBloc();

//=================== End Bloc =============================
}

void _initUtil() async {
  locator.registerSingleton<Dio>(Dio(
    BaseOptions(baseUrl: "https://startflutter.ir/api/"),
  ));

  locator.registerFactory<PaymentHandler>(() => ZarinPalHamdllerPayment(
        locator.get(),
      ));
  locator.registerFactory<UrlHandller>(() => UrlLuncher());
}

void _initDataSource() {
  locator.registerFactory<IAuthenticationDataSource>(
      () => AuthenticationDataSource());

  locator.registerFactory<ICategoryDataSource>(() => CategoryData());
  locator.registerFactory<IBannerDataSource>(() => BannerRemoteDataSource());
  locator.registerSingleton<IProductDataSource>(ProductRemoteDataSource());
  locator.registerFactory<IProductDetailDataSource>(() {
    return ProductDetailRemoteDatatSource();
  });

  locator.registerFactory<IProductCategoryDataSource>(
      () => ProductCategoryDataSource());
  locator.registerFactory<IBusketDataSource>(() => BusketDataSource());
  locator.registerFactory<ICommentDataSource>(() => CommentRemoteDataSource());

}

void _initRepository() {
  locator.registerFactory<IAuthenticatinRepository>(
      () => AuthenticatinRepository());
  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());
  locator.registerFactory<IBannerRepository>(() => BannerRemoteRepository());
  locator.registerFactory<IProductRepository>(() => ProductRemoteRepository());
  locator.registerFactory<IProductDetailRespotory>(
      () => ProductDetailRepository());
  locator.registerFactory<IProductCategoryRepostory>(
      () => ProductCategoryRepository());
  locator.registerFactory<IBusketRepository>(() => BusketRepository());
  locator.registerFactory<ICommentsRepository>(() => CommenstRepository());
}

void _initBloc() {
  locator.registerSingleton<BusketBloc>(BusketBloc(
    locator.get(),
    locator.get(),
  ));
}
