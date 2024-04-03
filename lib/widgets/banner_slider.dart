import "package:apple_shop/constants/colors.dart";
import "package:flutter/material.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

class BannerSlider extends StatelessWidget {
  var controller = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      SizedBox(
        height: 177,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: controller,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(8),
              height: 177,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const ClipRRect(
                child: FittedBox(
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/header_banner.png"),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      Positioned(
        bottom: 17,
        child: SmoothPageIndicator(
          controller: controller, // PageController
          count: 6,
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
