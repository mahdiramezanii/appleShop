class BannerModel {
  String categoryId;
  String collectionId;
  String id;
  String thumbnail;
  String collectionName;

  BannerModel({
    required this.categoryId,
    required this.collectionId,
    required this.id,
    required this.thumbnail,
    required this.collectionName,
  });

  factory BannerModel.fromJson(Map<String, dynamic> jsonObject) {
    return BannerModel(
      categoryId: jsonObject["categoryId"],
      collectionId: jsonObject["collectionId"],
      id: jsonObject["id"],
      thumbnail:
          "https://startflutter.ir/api/files/${jsonObject["collectionId"]}/${jsonObject["id"]}/${jsonObject["thumbnail"]}",
      collectionName: jsonObject["collectionName"],
    );
  }
}
