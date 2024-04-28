import 'package:apple_shop/data/models/product_gallery_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProductEvent {}

class InitialProductDetailEvent extends ProductEvent {
  String product_id;

  InitialProductDetailEvent({
    required this.product_id,
  });
}