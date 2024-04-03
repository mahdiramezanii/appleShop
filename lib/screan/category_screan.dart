import "package:apple_shop/constants/colors.dart";
import "package:flutter/material.dart";

class CategoryScrean extends StatelessWidget {
  const CategoryScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              sliver: SliverToBoxAdapter(
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
                        image:
                            AssetImage("assets/images/apple_haeder_logo.png"),
                      ),
                      Spacer(),
                      Text(
                        "دسته بندی",
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
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/category_item.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
