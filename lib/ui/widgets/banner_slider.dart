import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/data/model/banner.dart';
import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({
    super.key,
    required this.banners,
  });
  final List<BannerModel> banners;

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  PageController sliderController = PageController(viewportFraction: 0.9);

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
              itemCount: widget.banners.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsetsDirectional.only(
                    end: 10,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: widget.banners[index].thumbnail,
                      fit: BoxFit.cover,
                      // color: CustomColor.gray,
                    ),
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
