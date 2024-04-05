import "package:apple_shop/data/datasource/category_data_source.dart";
import "package:apple_shop/data/models/categori_model.dart";
import "package:apple_shop/di/service_locator.dart";
import "package:apple_shop/util/api_exception.dart";
import "package:dartz/dartz.dart";

abstract class ICategoryRepository {
  Future<Either<String,List<Category>>> getCategoryItem();
}

class CategoryRepository extends ICategoryRepository {
  final ICategoryDataSource _catDataSource = locator.get();

  @override
  Future<Either<String,List<Category>>> getCategoryItem() async {
    try {
      var response = await _catDataSource.getCategoryList();

      return Right(response);

    } on ApiExceptiopn catch (ex) {
      return Left(ex.messgae);
    } catch (ex) {
      return const Left("خطای غیرمنتظره");
    }
  }
}
