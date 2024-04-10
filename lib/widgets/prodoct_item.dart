import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/data/models/product_model.dart';
import 'package:apple_shop/widgets/cashNetwork.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget ProdouctItem(Product product) {
  return Container(
    height: 216,
    width: 160,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(15)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: CashNetworkImage(
                url: product.thumbnail,
                radius: 0,
              ),
            ),
            const Positioned(
              top: 0,
              right: 4,
              child: Image(
                image: AssetImage("assets/images/like.png"),
              ),
            ),
            Positioned(
              left: 5,
              bottom: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: MyColors.red,
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 1),
                  child: Text(
                    "%3",
                    style: TextStyle(fontFamily: "sm", color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 5, bottom: 5),
          child: Text(
            textAlign: TextAlign.end,
            "${product.name}",
            style: const TextStyle(fontFamily: "SB", fontSize: 14),
          ),
        ),
        Container(
          height: 53,
          width: 160,
          decoration: const BoxDecoration(
            color: MyColors.blue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "تومان",
                style: TextStyle(
                    fontFamily: "sm", fontSize: 14, color: Colors.white),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "134,000,000",
                    style: TextStyle(
                      fontFamily: "sm",
                      color: Colors.white,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.white,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationThickness: 3,
                    ),
                  ),
                  Text(
                    "110,000,000",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "sm",
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Image(image: AssetImage("assets/images/arrow.png"))
            ],
          ),
        )
      ],
    ),
  );
}
