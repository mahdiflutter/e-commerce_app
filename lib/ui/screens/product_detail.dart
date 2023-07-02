import 'dart:ui';

import 'package:e_commerce_app/ui/widgets/badge.dart';
import 'package:e_commerce_app/ui/widgets/header.dart';
import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CustomColor.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const Header(
                title: 'آیفون',
              ),
              SliverToBoxAdapter(
                child: Text(
                  'آیفون 13 پرومکس',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const ProductGallery(),
              const SelectColor(),
              const SelectMemory(),
              const CustomDropDown(),
              const CustomDropDown(),
              const CustomDropDown(),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverPadding(
      padding: EdgeInsets.only(
        left: 44.0,
        right: 44.0,
        bottom: 32.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            //https://github.com/amirahmadadibi/ecommerce_project/blob/main/lib/screens/product_detail_screen.dart at line 650
            AddToBasketButton(),
            SizedBox(
              width: 15.0,
            ),
            PriceButton(),
          ],
        ),
      ),
    );
  }
}

class PriceButton extends StatelessWidget {
  const PriceButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            child: Container(
              width: 130.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: CustomColor.green,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 160.0,
                  height: 53.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomBadge(content: '0'),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '17000000',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Text(
                            '17000000',
                            style: TextStyle(
                              fontFamily: 'shb',
                              color: CustomColor.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'تومان',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
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

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            child: Container(
              width: 130.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: CustomColor.blue,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 160.0,
                  height: 53.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Center(
                    child: Text(
                      'افزودن به سبد خرید',
                      style: TextStyle(
                        fontFamily: 'shb',
                        fontSize: 16,
                        color: CustomColor.white,
                      ),
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

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        left: 44.0,
        right: 44.0,
        bottom: 20.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
          height: 46.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1, color: CustomColor.gray),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              const Text('مشخصات فنی:'),
              const Spacer(),
              Text(
                'مشاهده',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(width: 10),
              const Icon(
                Iconsax.arrow_circle_left,
                color: CustomColor.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectMemory extends StatelessWidget {
  const SelectMemory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 44.0,
        vertical: 20.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('انتخاب حافظه داخلی'),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 74,
                  height: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                      color: CustomColor.gray,
                    ),
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SelectColor extends StatelessWidget {
  const SelectColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 44.0),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'انتخاب رنک',
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Container(
                  width: 26.0,
                  height: 26.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: CustomColor.blue,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProductGallery extends StatelessWidget {
  const ProductGallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 44.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
          height: 284.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(15),
            boxShadow: const [
              BoxShadow(
                color: CustomColor.gray,
                blurRadius: 10.0,
              )
            ],
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Iconsax.save_2,
                      ),
                      SizedBox(
                        width: 101.0,
                        height: 148.0,
                        child: Image.asset(
                          'assets/images/product.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Row(
                        children: [
                          Text('4'),
                          SizedBox(width: 10),
                          Icon(
                            Iconsax.star,
                            color: Colors.amber,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 45,
                  ),
                  child: SizedBox(
                    height: 90.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: 70.0,
                              height: 70.0,
                              margin: const EdgeInsets.only(
                                right: 20,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: CustomColor.gray,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
