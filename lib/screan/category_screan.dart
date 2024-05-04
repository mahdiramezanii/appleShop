import "package:apple_shop/bloc/category/category_bloc.dart";
import "package:apple_shop/bloc/category/category_event.dart";
import "package:apple_shop/bloc/category/category_state.dart";
import "package:apple_shop/constants/colors.dart";
import "package:apple_shop/data/models/categori_model.dart";
import "package:apple_shop/data/repository/category_repository.dart";
import "package:apple_shop/di/service_locator.dart";
import "package:apple_shop/widgets/cashNetwork.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class CategoryScrean extends StatelessWidget {
  List<Category> test = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(),
      child: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  MyWidget({super.key});

  List<Category> test = [];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryBloc>(context).add(GetCategoryEvent());
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
            BlocBuilder<CategoryBloc, CategoryState>(
                builder: ((context, state) {
              if (state is InitCategoryState) {
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return CashNetworkImage(
                          url: test[index].thumbnail,
                          radius: 0,
                        );
                      },
                      childCount: test.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                  ),
                );
              }
              if (state is ResponseCategoryState) {
                var respnse = state.response;

                respnse.fold((l) => print(l), (r) {
                  test = r;
                });

                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return CashNetworkImage(
                        url: test[index].thumbnail,
                        radius: 0,
                      );
                    }, childCount: test.length),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                  ),
                );
              }

              if (state is LoadDataCategoryState) {
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return CashNetworkImage(
                        url: test[index].thumbnail,
                        radius: 0,
                      );
                    }, childCount: test.length),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                  ),
                );
              } else {
                return const SliverToBoxAdapter(
                  child: Text("sssfgfg"),
                );
              }
            }))
          ],
        ),
      ),
    );
  }
}
