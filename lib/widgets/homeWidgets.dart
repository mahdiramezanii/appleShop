import 'package:apple_shop/bloc/category_product/category_product_bloc.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/data/models/categori_model.dart';
import 'package:apple_shop/screan/product_list.dart';
import 'package:apple_shop/widgets/cashNetwork.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

Widget CategoryHorizontalItem(int index, List<Category> category, context) {
  String color = "FF" + category[index].color;
  int hexColor = int.parse(color, radix: 16);
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (BuildContext context) {
              return ProductCategoryBloc();
            },
            child: ProductListScrean(
              category: category[index],
            ),
          );
        }));
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 3),
            width: 56,
            height: 56,
            decoration: ShapeDecoration(
              shadows: [
                BoxShadow(
                  blurRadius: 20,
                  color: Color(hexColor),
                  spreadRadius: -7,
                  offset: Offset(0, 10),
                )
              ],
              color: Color(hexColor),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: SizedBox(
                height: 26,
                width: 26,
                child: CashNetworkImage(
                  url: category[index].icon,
                  radius: 0,
                )),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "${category[index].title}",
            style: TextStyle(fontFamily: "SB"),
          )
        ],
      ),
    ),
  );
}
