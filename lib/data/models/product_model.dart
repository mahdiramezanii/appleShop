class Product {
  String id;
  String collectionId;
  String collectionName;
  String description;
  int discount_price;
  String name;
  String popularity;
  int price;
  int quantity;
  String thumbnail;
  String category;
  num? percent;
  int? realPrice;

  Product({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.description,
    required this.discount_price,
    required this.name,
    required this.popularity,
    required this.price,
    required this.quantity,
    required this.thumbnail,
    required this.category,
  }) {
    this.realPrice = (price + this.discount_price);
    this.percent = ((realPrice! - price) / price) * 100;
  }
  factory Product.fromJson(Map<String, dynamic> jsonObject) {
    return Product(
      id: jsonObject["id"],
      collectionId: jsonObject["collectionId"],
      collectionName: jsonObject["collectionName"],
      description: jsonObject["description"],
      discount_price: jsonObject["discount_price"],
      name: jsonObject["name"],
      popularity: jsonObject["popularity"],
      price: jsonObject["price"],
      quantity: jsonObject["quantity"],
      thumbnail:
          "https://startflutter.ir/api/files/${jsonObject["collectionId"]}/${jsonObject["id"]}/${jsonObject["thumbnail"]}",
      category: jsonObject["category"],
    );
  }
}
