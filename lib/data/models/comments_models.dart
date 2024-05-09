class Comments {
  String id;
  String product_id;
  String text;
  String user_id;

  Comments({
    required this.id,
    required this.product_id,
    required this.text,
    required this.user_id,
  });

  factory Comments.fromJson(Map<String, dynamic> jsonMapObject) {
    return Comments(
      id: jsonMapObject["id"],
      product_id: jsonMapObject["product_id"],
      text: jsonMapObject["text"],
      user_id: jsonMapObject["user_id"],
    );
  }
}
