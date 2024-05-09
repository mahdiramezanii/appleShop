
class Comments {
  String id;
  String product_id;
  String text;
  String user_id;
  String thumbnail;
  String name;

  Comments({
    required this.id,
    required this.product_id,
    required this.text,
    required this.user_id,
    required this.name,
    required this.thumbnail,
  });

  factory Comments.fromJson(Map<String, dynamic> jsonMapObject) {
    return Comments(
      id: jsonMapObject["id"],
      product_id: jsonMapObject["product_id"],
      text: jsonMapObject["text"],
      user_id: jsonMapObject["user_id"],
      name: jsonMapObject["expand"]["user_id"]["name"],
      thumbnail:
          "https://startflutter.ir/api/files/${jsonMapObject["expand"]["user_id"]["collectionName"]}/${jsonMapObject["expand"]["user_id"]["id"]}/${{
        jsonMapObject["expand"]["user_id"]["avatar"]
      }}",
    );
  }
}
