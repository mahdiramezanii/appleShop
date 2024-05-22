import 'package:apple_shop/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import "package:cached_network_image/cached_network_image.dart";
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CashNetworkImage extends StatelessWidget {
  CashNetworkImage({super.key, required this.url, required this.radius});
  String url;
  double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: url ?? "",
        placeholder: (context, url) {
          return SpinKitCircle(
            itemBuilder: (BuildContext context, int index) {
              return const DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
              );
            },
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            color: MyColors.grey,
            child: SpinKitCircle(
              itemBuilder: (BuildContext context, int index) {
                return const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
