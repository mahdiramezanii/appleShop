import 'package:apple_shop/bloc/category_product/category_product_bloc.dart';
import 'package:apple_shop/bloc/category_product/category_product_event.dart';
import 'package:apple_shop/bloc/category_product/category_product_state.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/data/models/categori_model.dart';
import 'package:apple_shop/widgets/prodoct_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScrean extends StatefulWidget {
  Category category;
  ProductListScrean({
    required this.category,
  });
  @override
  State<ProductListScrean> createState() => _ProductListScreanState();
}

class _ProductListScreanState extends State<ProductListScrean> {
  @override
  void initState() {
    BlocProvider.of<ProductCategoryBloc>(context)
        .add(GetProductCategoryEvent(categoryId: widget.category.id));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: MyColors.white,
          body: BlocBuilder<ProductCategoryBloc, ProductCategoryState>(
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        height: 46,
                        width: 340,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              width: 16,
                            ),
                            const Image(
                              image: AssetImage(
                                  "assets/images/apple_haeder_logo.png"),
                            ),
                            const Spacer(),
                            Text(
                              widget.category.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: "sm",
                                fontSize: 16,
                                color: MyColors.blue,
                              ),
                            ),
                            const Spacer()
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (state is ResultProductCategoeyState) ...[
                    state.product.fold((l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    }, (product) {
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: SliverPadding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          sliver: SliverGrid(
                            delegate: SliverChildBuilderDelegate((context, index) {
                              return ProdouctItem(product[index]);
                              // ProdouctItem(product[index])
                            }, childCount: product.length),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                          ),
                        ),
                      );
                    }),
                  ]
                ],
              );
            },
          )),
    );
  }
}
