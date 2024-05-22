import 'package:intl/intl.dart';

extension PricePasing on int {
  
  String formatPriceWithComma() {
    final formatter = NumberFormat("#,##0", "en_US");

    return formatter.format(this);
  }
}
