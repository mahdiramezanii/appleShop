import 'package:apple_shop/constants/colors.dart';
import 'package:flutter/material.dart';

  Widget Herader_search() {
    return Container(
      height: 46,
      width: 340,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(image: AssetImage("assets/images/apple_haeder_logo.png")),
          Text(
            "جستجوی محصولات",
            style:
                TextStyle(fontFamily: "sm", fontSize: 16, color: MyColors.grey),
          ),
          Image(image: AssetImage("assets/images/serach_icon.png")),
        ],
      ),
    );
  }

Widget CategoryHorizontalItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 3),
            width: 56,
            height: 56,
            decoration: ShapeDecoration(
              shadows: const [
                BoxShadow(
                    blurRadius: 20,
                    color: Colors.red,
                    spreadRadius: -7,
                    offset: Offset(0, 10))
              ],
              color: Colors.red,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Icon(
              Icons.select_all,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            "تست",
            style: TextStyle(fontFamily: "SB"),
          )
        ],
      ),
    );
  }