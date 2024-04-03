import 'package:apple_shop/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ProdouctItem() {
    return Container(
      height: 216,
      width: 160,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
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
              const Image(
                image: AssetImage(
                    "assets/images/iphone-13-pro-max-silver-select 1.png"),
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
          const Padding(
            padding: EdgeInsets.only(right: 5,bottom: 5),
            child: Text(
              "آیفون 13 پرومکس",
              style: TextStyle(fontFamily: "SB", fontSize: 14),
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
                          decorationThickness: 3),
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