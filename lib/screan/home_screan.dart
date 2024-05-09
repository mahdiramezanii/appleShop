import "package:apple_shop/bloc/busket/busket_bloc.dart";
import "package:apple_shop/bloc/home/home_bloc.dart";
import "package:apple_shop/bloc/home/home_event.dart";
import "package:apple_shop/bloc/home/home_state.dart";
import "package:apple_shop/bloc/product/product_bloc.dart";
import "package:apple_shop/constants/colors.dart";
import "package:apple_shop/di/service_locator.dart";
import "package:apple_shop/screan/detail_prodoct_item.dart";

import "package:apple_shop/widgets/banner_slider.dart";
import "package:apple_shop/widgets/homeWidgets.dart";
import "package:apple_shop/widgets/prodoct_item.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:loading_indicator/loading_indicator.dart";

class HomeScrean extends StatelessWidget {
  const HomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) {
        var bloc = HomeBloc();

        bloc.add(GetBannerHomeEvent());

        return bloc;
      },
      child: HomeWidget(),
    ));
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return getBodyHomeScrean(state, context);
        },
      ),
    );
  }

  Widget getBodyHomeScrean(HomeState state, BuildContext context) {
    if (state is LodingBannerHomeState) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: LoadingIndicator(
                indicatorType: Indicator.ballRotateChase,
                colors: [
                  MyColors.blue,
                  MyColors.red,
                ],
                strokeWidth: 2,
              ),
            ),
            Text(
              "توسعه دهنده:مهدی رمضانی",
              style: TextStyle(
                color: MyColors.grey,
                fontFamily: "sb",
              ),
            )
          ],
        ),
      );
    } else {
      return RefreshIndicator(
        onRefresh: () async {
          context.read<HomeBloc>().add(GetBannerHomeEvent());
        },
        strokeWidth: 3,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              sliver: SliverToBoxAdapter(
                child: Herader_search(),
              ),
            ),
            if (state is ResponseBannerHomeState) ...[
              // ignore: void_checks
              state.response.fold((l) {
                return SliverToBoxAdapter(
                  child: BannerSlider(),
                );
              }, (r) {
                return SliverToBoxAdapter(
                  child: BannerSlider(
                    response: r,
                  ),
                );
              })
            ],
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
                        style: TextStyle(
                          fontFamily: "sm",
                          color: MyColors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (state is ResponseBannerHomeState) ...[
                      state.categoryRespnse.fold((l) {
                        return SliverToBoxAdapter();
                      }, (r) {
                        return SizedBox(
                          height: 90,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: r.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CategoryHorizontalItem(
                                    index, r, context);
                              },
                            ),
                          ),
                        );
                      })
                    ]
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
                    if (state is ResponseBannerHomeState) ...[
                      state.bestSellerProduct.fold((l) {
                        return Text(l);
                      }, (product) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: SizedBox(
                            height: 200,
                            child: ListView.builder(
                              itemCount: product.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return BlocProvider<
                                                BusketBloc>.value(
                                              value: locator.get<BusketBloc>(),
                                              child: DetailProductScrean(
                                                product[index],
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: ProdouctItem(
                                      product[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      })
                    ],
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
                    if (state is ResponseBannerHomeState) ...{
                      state.hotestProduct.fold((l) {
                        return const Text("خطا");
                      }, (product) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: SizedBox(
                            height: 200,
                            child: ListView.builder(
                              itemCount: product.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return BlocProvider<
                                                BusketBloc>.value(
                                              value: locator.get<BusketBloc>(),
                                              child: DetailProductScrean(
                                                product[index],
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: ProdouctItem(
                                      product[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      })
                    }
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
