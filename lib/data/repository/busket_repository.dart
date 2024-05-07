import 'package:apple_shop/data/datasource/busket_datasource.dart';
import 'package:apple_shop/data/models/bucket_model.dart';
import 'package:apple_shop/data/models/product_model.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:dartz/dartz.dart';

abstract class IBusketRepository {
  Future<Either<String, String>> addProductToBusket(Product product);
  Future<Either<String, List<Bucket>>> fetchBucketList();
  Future<int> getTotalPrice();

  
}

class BusketRepository extends IBusketRepository {
  IBusketDataSource _dataSuorce = locator.get();
  @override
  Future<Either<String, String>> addProductToBusket(product) async {
    try {
      var respone = await _dataSuorce.addProductToBusket(product);

      return const Right("محصول با موفقیت به سبد خرید اضافه شد");
    } catch (ex) {
      return const Left("خطای غیر منتظره رخ داد");
    }
  }

  @override
  Future<Either<String, List<Bucket>>> fetchBucketList() async {
    try {
      var respone = await _dataSuorce.fetchBucketList();
      return Right(respone);
    } catch (ex) {
      return const Left("خطایی رخ داده است");
    }
  }
  
  @override
  Future<int> getTotalPrice() async {

    var response=_dataSuorce.getTotalPrice();
    return response;
  
  }
  
}
