import "package:flutter/material.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

class BannerSlider extends StatelessWidget {
  var controller = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      SizedBox(
        height: 200,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: controller,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(8),
              height: 200,
              width: double.infinity,
              color: Colors.indigoAccent,
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
            activeDotColor: Colors.red,
            expansionFactor: 5,
          ), // your preferred effect
        ),
      )
    ]);
  }
}
