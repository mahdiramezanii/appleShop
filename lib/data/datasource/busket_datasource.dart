import 'package:apple_shop/data/models/bucket_model.dart';
import 'package:apple_shop/data/models/product_model.dart';
import 'package:hive/hive.dart';

abstract class IBusketDataSource {
  Future<void> addProductToBusket(Product product);
  Future<List<Bucket>> fetchBucketList();
  Future<int> getTotalPrice();
  Future<void> removeBusketItem(int index);
}

class BusketDataSource extends IBusketDataSource {
  @override
  Future<void> addProductToBusket(Product product) async {
    var box = Hive.box<Bucket>("BucketBox");

    var item = Bucket(
      id: product.id,
      collectionId: product.collectionId,
      collectionName: product.collectionName,
      discount_price: product.discount_price,
      name: product.name,
      price: product.price,
      quantity: product.quantity,
      thumbnail: product.thumbnail,
    );
    box.add(item);
  }

  @override
  Future<List<Bucket>> fetchBucketList() async {
    var box = Hive.box<Bucket>("BucketBox");
    List<Bucket> response = box.values.toList();
    return response;
  }

  @override
  Future<int> getTotalPrice() async {
    var box = Hive.box<Bucket>("BucketBox").values.toList();
    var totalPrice = box.fold(0, (calculator, product) {
      return calculator + product.realPrice!;
    });
    return totalPrice;
  }
  
  @override
  Future<void> removeBusketItem(int index) async {

    try{

      var box = Hive.box<Bucket>("BucketBox").values.toList();
      
      var b=box.elementAt(index);
      b.delete();
      
    } catch (ex){

      throw ex;
    }

       

  }
}
