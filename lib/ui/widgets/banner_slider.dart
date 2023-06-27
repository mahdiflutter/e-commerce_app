import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  PageController sliderController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 177.0,
            child: PageView.builder(
              controller: sliderController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsetsDirectional.only(
                    end: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(15.0),
                    color: CustomColor.gray,
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 8.0,
            child: SmoothPageIndicator(
              //Read More in https://pub.dev/packages/smooth_page_indicator/example
              controller: sliderController,
              count: 3,
              effect: const ExpandingDotsEffect(
                activeDotColor: CustomColor.blue,
                dotColor: CustomColor.white,
                dotWidth: 5.0,
                dotHeight: 5.0,
                expansionFactor: 7.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
