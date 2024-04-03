import "package:apple_shop/constants/colors.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class ProfileScrean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        body: Column(
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                height: 46,
                width: 340,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Image(
                      image: AssetImage("assets/images/apple_haeder_logo.png"),
                    ),
                    Spacer(),
                    Text(
                      "حساب کاربری",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "sm",
                        fontSize: 16,
                        color: MyColors.blue,
                      ),
                    ),
                    Spacer()
                  ],
                ),
              ),
            ),
            const Text(
              "مهدی رمضانی",
              style: TextStyle(fontFamily: "SB", fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "09910765749",
              style: TextStyle(
                  fontFamily: "sb", color: MyColors.grey, fontSize: 12),
            ),
            const SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Wrap(
                spacing: 40,
                runSpacing: 20,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: ShapeDecoration(
                          color: MyColors.blue,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: const Image(
                            image: AssetImage("assets/images/discount.png")),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "تخفیف ها",
                        style: TextStyle(fontFamily: "SB"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: ShapeDecoration(
                          color: MyColors.blue,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: const Image(
                            image: AssetImage("assets/images/discount.png")),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "تخفیف ها",
                        style: TextStyle(fontFamily: "SB"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: ShapeDecoration(
                          color: MyColors.blue,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: const Image(
                            image: AssetImage("assets/images/discount.png")),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "تخفیف ها",
                        style: TextStyle(fontFamily: "SB"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: ShapeDecoration(
                          color: MyColors.blue,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: const Image(
                            image: AssetImage("assets/images/discount.png")),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "تخفیف ها",
                        style: TextStyle(fontFamily: "SB"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: ShapeDecoration(
                          color: MyColors.blue,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: const Image(
                            image: AssetImage("assets/images/discount.png")),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "تخفیف ها",
                        style: TextStyle(fontFamily: "SB"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: ShapeDecoration(
                          color: MyColors.blue,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: const Image(
                            image: AssetImage("assets/images/discount.png")),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "تخفیف ها",
                        style: TextStyle(fontFamily: "SB"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: ShapeDecoration(
                          color: MyColors.blue,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: const Image(
                            image: AssetImage("assets/images/discount.png")),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "تخفیف ها",
                        style: TextStyle(fontFamily: "SB"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: ShapeDecoration(
                          color: MyColors.blue,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: const Image(
                            image: AssetImage("assets/images/discount.png")),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "تخفیف ها",
                        style: TextStyle(fontFamily: "SB"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: ShapeDecoration(
                          color: MyColors.blue,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: const Image(
                            image: AssetImage("assets/images/discount.png")),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "تخفیف ها",
                        style: TextStyle(fontFamily: "SB"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Text(
              "اپل شاپ",
              style: TextStyle(
                fontFamily: "sm",
                fontSize: 10,
                color: MyColors.grey,
              ),
            ),
            const Text(
              "v-1.0.1",
              style: TextStyle(
                fontFamily: "sm",
                fontSize: 10,
                color: MyColors.grey,
              ),
            ),
            const Text(
              "instagram.com/mahdireamezanii.dev",
              style: TextStyle(
                fontFamily: "sm",
                fontSize: 10,
                color: MyColors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
