import 'package:apple_shop/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_indicator/loading_indicator.dart';

Widget AnimitaionLoading() {
  return const SizedBox(
    height: 80,
    width: 80,
    child: LoadingIndicator(
      indicatorType: Indicator.ballRotateChase,
      colors: [
        MyColors.blue,
        MyColors.red,
      ],
      strokeWidth: 2,
    ),
  );
}
