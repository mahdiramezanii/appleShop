abstract class ProductCategoryEvent {}

class GetProductCategoryEvent extends ProductCategoryEvent {
  String categoryId;

  GetProductCategoryEvent({
    required this.categoryId,
  });
}
