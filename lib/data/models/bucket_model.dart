import 'package:hive/hive.dart';

part 'bucket_model.g.dart';

@HiveType(typeId: 0)
class Bucket {
  @HiveField(0)
  String id;
  @HiveField(1)
  String collectionId;
  @HiveField(2)
  String collectionName;
  @HiveField(3)
  int discount_price;
  @HiveField(4)
  String name;
  @HiveField(5)
  int price;
  @HiveField(6)
  int quantity;
  @HiveField(7)
  String thumbnail;
  @HiveField(8)
  num? percent;
  @HiveField(9)
  int? realPrice;

  Bucket({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.discount_price,
    required this.name,
    required this.price,
    required this.quantity,
    required this.thumbnail,
  }) {
    this.realPrice = (price + this.discount_price);
    this.percent = ((realPrice! - price) / price) * 100;
    this.thumbnail =
        "https://startflutter.ir/api/files/$collectionId/$id/$thumbnail";
  }
}
