import "package:apple_shop/bloc/busket/busket_bloc.dart";
import "package:apple_shop/bloc/busket/busket_event.dart";
import "package:apple_shop/bloc/busket/busket_state.dart";
import "package:apple_shop/constants/colors.dart";
import "package:apple_shop/data/models/bucket_model.dart";
import "package:apple_shop/util/extentions/extentions.dart";
import "package:apple_shop/util/extentions/int_exception.dart";
import "package:dotted_line/dotted_line.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class OrderScrean extends StatefulWidget {
  const OrderScrean({super.key});

  @override
  State<OrderScrean> createState() => _OrderScreanState();
}

class _OrderScreanState extends State<OrderScrean> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        body: BlocBuilder<BusketBloc, BusketState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomScrollView(
                  slivers: [
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
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image(
                              image: AssetImage(
                                "assets/images/apple_haeder_logo.png",
                              ),
                            ),
                            Text(
                              "سبد خرید",
                              style: TextStyle(
                                fontFamily: "sb",
                                fontSize: 18,
                                color: MyColors.blue,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    if (state is ResponsebusketState) ...{
                      state.response.fold((l) {
                        return SliverToBoxAdapter(
                          child: Text(l),
                        );
                      }, (busketList) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return OrderItemWidget(busketList[index], index);
                            },
                            childCount: busketList.length,
                          ),
                        );
                      })
                    }
                  ],
                ),
                if (state is ResponsebusketState) ...{
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      context
                          .read<BusketBloc>()
                          .add(InitialPaymentRequestEvent());

                      context.read<BusketBloc>().add(PaymentRequestEvnt());
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          " پرداخت مبلغ ${state.total_price.formatPriceWithComma()}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "sm",
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                      ],
                    ),
                  ),
                }
              ],
            );
          },
        ),
      ),
    );
  }
}

class OrderItemWidget extends StatelessWidget {
  Bucket busket;
  int index;
  OrderItemWidget(
    this.busket,
    this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 10,
      ),
      height: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      busket.name,
                      style: const TextStyle(
                        fontFamily: "sb",
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Text(
                      "گارانتی 18 ماهه مدیا پردازش",
                      style: TextStyle(
                        fontFamily: "sm",
                        color: MyColors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: MyColors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 0.3,
                            ),
                            child: Text(
                              "%3",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "sm",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "تومان",
                          style: TextStyle(
                            fontFamily: "sm",
                            color: MyColors.grey,
                          ),
                        ),
                        Text(
                          "${busket.price}",
                          style: const TextStyle(
                            fontFamily: "sm",
                            color: MyColors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 200,
                      child: Wrap(
                        textDirection: TextDirection.rtl,
                        spacing: 4,
                        runSpacing: 5,
                        children: [
                          itemChip(title: "سبز", color: "33ff39"),
                          itemChip(title: "254 گیگ"),
                          itemChip(title: "254 گیگ"),
                          itemChip(title: "254 گیگ"),
                          itemChip(title: "254 گیگ"),
                          GestureDetector(
                            onTap: () async {
                              context
                                  .read<BusketBloc>()
                                  .add(RemoveItemBusket(busket_id: index));
                            },
                            child: TrashChip(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                const Image(
                  image: AssetImage(
                    "assets/images/iphone-13-pro-max-silver-select 1.png",
                  ),
                ),
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
          const SizedBox(
            height: 10,
          ),
          Text(
            busket.realPrice!.formatPriceWithComma(),
            style: const TextStyle(
              color: Colors.black,
              fontFamily: "sb",
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget itemChip({String? color, required String title}) {
    return Container(
      height: 25,
      width: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: MyColors.grey,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 3,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              width: 2,
            ),
            Text(
              title,
              maxLines: 1,
              style: const TextStyle(
                color: MyColors.grey,
                fontFamily: "sm",
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            if (color != null) ...{
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: color.convertToColor(),
                  borderRadius: BorderRadius.circular(20),
                ),
              )
            }
          ],
        ),
      ),
    );
  }

  Widget TrashChip() {
    return Container(
      height: 25,
      width: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: MyColors.red,
          width: 1,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 3,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 2,
            ),
            Text(
              "حذف",
              maxLines: 1,
              style: TextStyle(
                color: MyColors.red,
                fontFamily: "sm",
              ),
            ),
            SizedBox(
              width: 2,
            ),
            Image(
              image: AssetImage("assets/images/delete.png"),
              color: MyColors.red,
            )
          ],
        ),
      ),
    );
  }
}
