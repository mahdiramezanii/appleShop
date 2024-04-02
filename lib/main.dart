import 'package:apple_shop/widgets/banner_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(),
      ),
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              BannerSlider(),
              SizedBox(
                height: 90,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryHorizontalItem(index);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
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
            width: 60,
            height: 60,
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
}
