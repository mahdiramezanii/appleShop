class Category {
  String collectionId;
  String collectionName;
  String color;
  String icon;
  String thumbnail;
  String title;
  String id;

  Category({
    required this.collectionId,
    required this.collectionName,
    required this.color,
    required this.icon,
    required this.thumbnail,
    required this.title,
    required this.id,
  });

  factory Category.fromJson(Map<String, dynamic> jsonObject) {
    return Category(
      collectionId: jsonObject["collectionId"],
      collectionName: jsonObject["collectionName"],
      color: jsonObject["color"],
      icon: jsonObject["icon"],
      thumbnail:
          "https://startflutter.ir/api/files/${jsonObject["collectionId"]}/${jsonObject["id"]}/${jsonObject["thumbnail"]}",
      title: jsonObject["title"],
      id: jsonObject["id"],
    );
  }
}
