class PruductGallery {
  String image_url;
  String product_id;

  PruductGallery({
    required this.image_url,
    required this.product_id,
  });

  factory PruductGallery.fromJson(Map<String, dynamic> jsonMapObject) {
    return PruductGallery(
      image_url:
          "https://startflutter.ir/api/files/${jsonMapObject["collectionId"]}/${jsonMapObject["id"]}/${jsonMapObject["image"]}",
      product_id: jsonMapObject["product_id"],
    );
  }
}
