import "package:apple_shop/constants/colors.dart";
import "package:apple_shop/widgets/banner_slider.dart";
import "package:apple_shop/widgets/prodoct_item.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class HomeScrean extends StatelessWidget {
  const HomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              sliver: SliverToBoxAdapter(child: Herader_search()),
            ),
            SliverToBoxAdapter(
              child: BannerSlider(),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "دسته بندی",
                        style:
                            TextStyle(fontFamily: "sm", color: MyColors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 30, right: 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Image(image: AssetImage("assets/images/left.png")),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "مشاهده همه",
                          style: TextStyle(
                              fontFamily: "sm",
                              fontSize: 12,
                              color: MyColors.blue),
                        ),
                        Spacer(),
                        Text(
                          "پرفروش ترین ها",
                          style: TextStyle(
                            fontFamily: "sm",
                            color: MyColors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: ProdouctItem(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 30, right: 20, bottom: 30),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Image(image: AssetImage("assets/images/left.png")),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "مشاهده همه",
                          style: TextStyle(
                              fontFamily: "sm",
                              fontSize: 12,
                              color: MyColors.blue),
                        ),
                        Spacer(),
                        Text(
                          "پر بازدیدترین ها",
                          style: TextStyle(
                            fontFamily: "sm",
                            color: MyColors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: ProdouctItem(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
}
