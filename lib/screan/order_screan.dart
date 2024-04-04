import "package:apple_shop/constants/colors.dart";
import "package:dotted_line/dotted_line.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class OrderScrean extends StatelessWidget {
  const OrderScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              height: 46,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(
                      image: AssetImage("assets/images/apple_haeder_logo.png")),
                  Text(
                    "سبد خرید",
                    style: TextStyle(
                        fontFamily: "sb", fontSize: 18, color: MyColors.blue),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              height: 260,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "  2 آیفون 13 پرومکس 256 گیگ",
                              style: TextStyle(
                                fontFamily: "sb",
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Text(
                              "گارانتی 18 ماهه مدیا پردازش",
                              style: TextStyle(
                                  fontFamily: "sm", color: MyColors.grey),
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: MyColors.red,
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 0.3),
                                    child: Text(
                                      "%3",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "sm"),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "تومان",
                                  style: TextStyle(
                                      fontFamily: "sm", color: MyColors.grey),
                                ),
                                const Text(
                                  "45,000,000",
                                  style: TextStyle(
                                      fontFamily: "sm", color: MyColors.grey),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: MyColors.grey, width: 1)),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Image(
                                            image: AssetImage(
                                                "assets/images/shift.png")),
                                        Text(
                                          "۲۵۶ گیگابایت",
                                          style: TextStyle(
                                              color: MyColors.grey,
                                              fontFamily: "sm"),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Container(
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: MyColors.grey, width: 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 3),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Image(
                                            image: AssetImage(
                                                "assets/images/shift.png")),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        const Text(
                                          "سبز کله غازی",
                                          style: TextStyle(
                                              color: MyColors.grey,
                                              fontFamily: "sm"),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Image(
                            image: AssetImage(
                                "assets/images/iphone-13-pro-max-silver-select 1.png")),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: MyColors.grey,
                    dashRadius: 0.0,
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 0.0,
                  ),
                  const Text(
                    "43,000,000",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "sb",
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
