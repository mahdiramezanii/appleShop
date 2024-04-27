class Varibent {
  String id;
  String name;
  String price_change;
  String product_id;
  String type_id;
  String value;

  Varibent({
    required this.id,
    required this.name,
    required this.price_change,
    required this.product_id,
    required this.type_id,
    required this.value,
  });

  factory Varibent.fromJson(Map<String, dynamic> jsonMapObject) {
    return Varibent(
      id: jsonMapObject["id"],
      name: jsonMapObject["name"],
      price_change: jsonMapObject["price_change"],
      product_id: jsonMapObject["product_id"],
      type_id: jsonMapObject["type_id"],
      value: jsonMapObject["value"],
    );
  }
}
