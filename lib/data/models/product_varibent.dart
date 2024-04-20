import 'package:apple_shop/data/models/varibent_model.dart';
import 'package:apple_shop/data/models/varient_type_model.dart';

class ProductVaribent {
  VarientType varibent_type;
  List<Varibent> varibent_list;

  ProductVaribent({
    required this.varibent_list,
    required this.varibent_type,
  });
}
