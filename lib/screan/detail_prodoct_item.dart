import "dart:ui";

import "package:apple_shop/bloc/busket/busket_bloc.dart";
import "package:apple_shop/bloc/busket/busket_event.dart";
import "package:apple_shop/bloc/comments/comment_bloc.dart";
import "package:apple_shop/bloc/comments/comment_event.dart";
import "package:apple_shop/bloc/comments/comment_state.dart";
import "package:apple_shop/bloc/product/product_bloc.dart";
import "package:apple_shop/bloc/product/product_event.dart";
import "package:apple_shop/bloc/product/product_state.dart";
import "package:apple_shop/constants/colors.dart";
import "package:apple_shop/data/models/product_gallery_model.dart";
import "package:apple_shop/data/models/product_model.dart";
import "package:apple_shop/data/models/product_properties.dart";
import "package:apple_shop/data/models/product_varibent.dart";
import "package:apple_shop/data/models/varient_type_model.dart";
import "package:apple_shop/di/service_locator.dart";
import "package:apple_shop/util/animitaion_loading.dart";
import "package:apple_shop/widgets/cashNetwork.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/painting.dart";
import "package:flutter/rendering.dart";
import "package:flutter/widgets.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class DetailProductScrean extends StatefulWidget {
  DetailProductScrean(this.product, {super.key});
  Product product;

  @override
  State<DetailProductScrean> createState() => _DetailProductScreanState();
}

class _DetailProductScreanState extends State<DetailProductScrean> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = ProductBloc();
        bloc.add(
          InitialProductDetailEvent(
            product_id: widget.product.id,
            category_id: widget.product.category,
          ),
        );
        return bloc;
      },
      child: ContentWidgets(widget: widget),
    );
  }
}

class ContentWidgets extends StatelessWidget {
  const ContentWidgets({
    super.key,
    required this.widget,
  });

  final DetailProductScrean widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductDetailLoadingState) {
          return Scaffold(
            body: Center(
              child: AnimitaionLoading(),
            ),
          );
        }
        return SafeArea(
          child: Scaffold(
            backgroundColor: MyColors.white,
            body: CustomScrollView(
              slivers: [
                if (state is ProductDetailResultState) ...{
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 30,
                      ),
                      height: 46,
                      width: 340,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Image(
                            image: AssetImage(
                              "assets/images/apple_haeder_logo.png",
                            ),
                          ),
                          state.getCategory.fold((l) {
                            return const Text(
                              "دسته بندی",
                              style: TextStyle(
                                fontFamily: "sb",
                                fontSize: 16,
                                color: MyColors.blue,
                              ),
                            );
                          }, (r) {
                            return Text(
                              r.title,
                              style: const TextStyle(
                                fontFamily: "sb",
                                fontSize: 16,
                                color: MyColors.blue,
                              ),
                            );
                          }),
                          const Image(
                            image: AssetImage(
                              "assets/images/right_shift.png",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                },
                if (state is ProductDetailResultState) ...{
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        widget.product.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: "sb",
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                },
                if (state is ProductDetailResultState) ...{
                  state.product_image_list.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (response) {
                    return CardImage(response);
                  }),
                },
                if (state is ProductDetailResultState) ...{
                  state.productVaribent.fold((l) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text(l)),
                    );
                  }, (productVaribent) {
                    return VarientGeneratorCaontainer(
                      productVarient: productVaribent,
                    );
                  })
                },
                if (state is ProductDetailResultState) ...{
                  state.getProperties.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (properties) {
                    return ProductProperties(
                      properties: properties,
                    );
                  }),
                },
                if (state is ProductDetailResultState) ...{
                  ProductDiscription(widget.product),
                  SliverToBoxAdapter(
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            isDismissible: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return DraggableScrollableSheet(
                                maxChildSize: 0.7,
                                minChildSize: 0.1,
                                initialChildSize: 0.3,
                                builder: (context, controller) {
                                  return BlocProvider(
                                    create: (context) {
                                      var bloc = CommentBloc(locator.get());
                                      bloc.add(GetCommntsEvent(
                                        productId: widget.product.id,
                                      ));
                                      return bloc;
                                    },
                                    child: CommentButtonShit(
                                      controller,
                                      widget.product,
                                    ),
                                  );
                                },
                              );
                            });
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 40, right: 40),
                        child: Container(
                          width: 340,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: MyColors.grey,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Image.asset("assets/images/left_shift.png"),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "مشاهده",
                                  style: TextStyle(
                                    fontFamily: "sb",
                                    color: MyColors.blue,
                                  ),
                                ),
                                const Spacer(),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      child: Container(
                                        height: 26,
                                        width: 26,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 10,
                                      child: Container(
                                        height: 26,
                                        width: 26,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 20,
                                      child: Container(
                                        height: 26,
                                        width: 26,
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 30,
                                      child: Container(
                                        height: 26,
                                        width: 26,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 40,
                                      child: Container(
                                        height: 26,
                                        width: 26,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 50,
                                      child: Container(
                                        height: 26,
                                        width: 26,
                                        decoration: BoxDecoration(
                                            color: MyColors.grey,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: const Center(
                                          child: Text(
                                            "+10",
                                            style: TextStyle(
                                              fontFamily: "sm",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "نظرات کاربران",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "sb",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 40, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const PayCart(),
                          AddToBacket(widget.product),
                        ],
                      ),
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(bottom: 20))
                }
              ],
            ),
          ),
        );
      },
    );
  }
}

class CommentButtonShit extends StatelessWidget {
  ScrollController _controller;
  Product product;

  CommentButtonShit(this._controller, this.product);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController();

    return BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
      if (state is LoadingCommentsState) {
        return Scaffold(
          backgroundColor: MyColors.grey,
          body: Center(child: AnimitaionLoading()),
        );
      }
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 50,
                height: 3,
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: CustomScrollView(
                  controller: _controller,
                  slivers: [
                    if (state is ResponseCommentState) ...{
                      state.response.fold((l) {
                        return SliverToBoxAdapter(
                          child: Text(l),
                        );
                      }, (comment) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(16),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: MyColors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          comment[index].name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          comment[index].text,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CashNetworkImage(
                                      url: comment[index].thumbnail,
                                      radius: 0,
                                    )
                                  ],
                                ),
                              );
                            },
                            childCount: comment.length,
                          ),
                        );
                      })
                    },
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: "نظر خود را وارد کنید",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: MyColors.grey,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: MyColors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CommentBloc>().add(
                        SendCommentEvent(
                          productId: product.id,
                          comment: _textController.text,
                        ),
                      );
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                    backgroundColor: MyColors.blue,
                    maximumSize: const Size(200, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                child: const Text(
                  "ارسال نظر",
                  style: TextStyle(
                    color: MyColors.white,
                    fontSize: 18,
                    fontFamily: "sb",
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      );
    });
  }
}

class ProductProperties extends StatefulWidget {
  List<Properties> properties;
  ProductProperties({
    key,
    required this.properties,
  });

  @override
  State<ProductProperties> createState() => _ProductPropertiesState();
}

class _ProductPropertiesState extends State<ProductProperties> {
  bool _is_visible = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _is_visible = !_is_visible;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Container(
                width: 340,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: MyColors.grey, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Image.asset("assets/images/left_shift.png"),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "مشاهده",
                        style:
                            TextStyle(fontFamily: "sb", color: MyColors.blue),
                      ),
                      const Spacer(),
                      const Text(
                        "مشخصات فنی",
                        style: TextStyle(color: Colors.black, fontFamily: "sb"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _is_visible,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Container(
                width: 340,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: MyColors.grey, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.builder(
                      itemCount: widget.properties.length,
                      itemBuilder: (BuildContext context, int index) {
                        var properties = widget.properties[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${properties.value} : ${properties.title}",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontFamily: "sm",
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDiscription extends StatefulWidget {
  Product product;
  ProductDiscription(this.product, {super.key});

  @override
  State<ProductDiscription> createState() => _ProductDiscriptionState();
}

class _ProductDiscriptionState extends State<ProductDiscription> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isVisible = !_isVisible;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 40,
                right: 40,
              ),
              child: Container(
                width: 340,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: MyColors.grey, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Image.asset("assets/images/left_shift.png"),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "مشاهده",
                        style: TextStyle(
                          fontFamily: "sb",
                          color: MyColors.blue,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "توضیحات محصول",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "sb",
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _isVisible,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 40,
                right: 40,
              ),
              child: Container(
                width: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: MyColors.grey, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    widget.product.description,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "sm",
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VarientGeneratorCaontainer extends StatelessWidget {
  List<ProductVaribent> productVarient;

  VarientGeneratorCaontainer({super.key, required this.productVarient});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var product_varient in productVarient) ...{
            VarientGeneratorChild(
              productVarient: product_varient,
            ),
          }
        ],
      ),
    );
  }
}

class VarientGeneratorChild extends StatelessWidget {
  ProductVaribent productVarient;

  VarientGeneratorChild({required this.productVarient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            productVarient.varibent_type.title,
            style: const TextStyle(fontFamily: "sb"),
          ),
          const SizedBox(
            height: 5,
          ),
          if (productVarient.varibent_type.type == VarientTypeEnum.COLOR) ...{
            ColorVarientListView(
              productVarient: productVarient,
            )
          },
          if (productVarient.varibent_type.type ==
              VarientTypeEnum.STORAGES) ...{
            StoragesVaribentListView(productVaribent: productVarient)
          }
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ColorVarientListView extends StatefulWidget {
  ProductVaribent productVarient;

  ColorVarientListView({super.key, required this.productVarient});

  @override
  State<ColorVarientListView> createState() => _ColorVarientListViewState();
}

class _ColorVarientListViewState extends State<ColorVarientListView> {
  var _selected_index = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 26,
        child: ListView.builder(
          itemCount: widget.productVarient.varibent_list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            String color =
                "FF" + widget.productVarient.varibent_list[index].value;
            int hexColor = int.parse(color, radix: 16);
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selected_index = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                width: _selected_index == index ? 60 : 30,
                child: Container(
                  margin: const EdgeInsets.only(right: 7),
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(hexColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: _selected_index == index
                      ? Center(
                          child: Text(
                            widget.productVarient.varibent_list[index].name,
                            style: TextStyle(
                              fontFamily: "sm",
                              color: widget.productVarient.varibent_list[index]
                                          .name ==
                                      "سیاه"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        )
                      : const Text(""),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class StoragesVaribentListView extends StatefulWidget {
  ProductVaribent productVaribent;
  StoragesVaribentListView({super.key, required this.productVaribent});

  @override
  State<StoragesVaribentListView> createState() =>
      _StoragesVaribentListViewState();
}

class _StoragesVaribentListViewState extends State<StoragesVaribentListView> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 26,
        child: ListView.builder(
          itemCount: widget.productVaribent.varibent_list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 30,
              width: 76,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: MyColors.blue,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  widget.productVaribent.varibent_type.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "sm",
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AddToBacket extends StatelessWidget {
  Product product;
  AddToBacket(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ProductBloc>(context).add(
          AddProductToBusket(
            product: product,
          ),
        );
        context.read<BusketBloc>().add(FetchBusketEvent());
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 150,
            height: 50,
            decoration: BoxDecoration(
              color: MyColors.blue,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Positioned(
            top: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20,
                  sigmaY: 30,
                ),
                child: Container(
                  width: 160,
                  height: 53,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "افزودن به سبد خرید",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "sb",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PayCart extends StatelessWidget {
  const PayCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            color: MyColors.green,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Positioned(
          top: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 30,
              ),
              child: Container(
                width: 160,
                height: 53,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "تومان",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "sm",
                      ),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "17,000,098",
                          style: TextStyle(
                            fontFamily: "sm",
                            color: Colors.white,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.white,
                          ),
                        ),
                        Text(
                          "16,989,000",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "sb",
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: MyColors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 1,
                        ),
                        child: Text(
                          "%5",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "sm",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CardImage extends StatelessWidget {
  List<PruductGallery> imageGalerryList;
  CardImage(this.imageGalerryList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        height: 340,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/star.png",
                    ),
                    const Text(
                      "4.3",
                      style: TextStyle(fontFamily: "sm"),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: double.infinity,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: CashNetworkImage(
                            url: imageGalerryList[0].image_url ?? "",
                            radius: 0,
                          )),
                    ),
                    const Spacer(),
                    Image.asset(
                      "assets/images/like.png",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageGalerryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 10),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 1,
                          color: MyColors.grey,
                        ),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: CashNetworkImage(
                            url: imageGalerryList[index].image_url ?? "",
                            radius: 15,
                          )),
                    );
                  }),
            ),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
