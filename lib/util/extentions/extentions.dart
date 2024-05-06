import 'dart:ui';

extension parseColor on String {
  Color convertToColor() {
    String color = "FF" + (this);

    int hexColor = int.parse(color, radix: 16);

    return Color(hexColor);
  }
}
