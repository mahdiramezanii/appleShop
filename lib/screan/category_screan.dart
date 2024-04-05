import "package:apple_shop/constants/colors.dart";
import "package:apple_shop/data/repository/category_repository.dart";
import "package:apple_shop/di/service_locator.dart";
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
            SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () async {

                ICategoryRepository _test=locator.get();

                var response=await _test.getCategoryItem();

                response.fold((l) => print(l), (r) => print(r));

                },
                child: const Text(
                  "گرفتن دیتا",
                  style: TextStyle(
                      color: Colors.black, fontSize: 20, fontFamily: "sm"),
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
