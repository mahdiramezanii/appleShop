import "package:apple_shop/constants/colors.dart";
import "package:apple_shop/data/models/banner_model.dart";
import "package:apple_shop/widgets/cashNetwork.dart";
import "package:flutter/material.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

// ignore: must_be_immutable
class BannerSlider extends StatelessWidget {
  BannerSlider({super.key, this.response});
  List<BannerModel>? response;

  var controller = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      SizedBox(
        height: 177,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: controller,
          itemCount: response?.length ?? 1,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(8),
              height: 177,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: CashNetworkImage(url: response?[index].thumbnail ?? ""),
            );
          },
        ),
      ),
      Positioned(
        bottom: 17,
        child: SmoothPageIndicator(
          controller: controller, // PageController
          count: 3 ?? 1,
          effect: const ExpandingDotsEffect(
            dotColor: Colors.white,
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: MyColors.blue,
            expansionFactor: 5,
          ), // your preferred effect
        ),
      )
    ]);
  }
}
