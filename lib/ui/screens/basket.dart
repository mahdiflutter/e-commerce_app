import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:e_commerce_app/ui/widgets/badge.dart';
import 'package:e_commerce_app/ui/widgets/header.dart';
import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CustomColor.white,
        body: SafeArea(
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  const Header(title: 'سبد خرید'),
                  SliverPadding(
                    padding: const EdgeInsets.only(
                      right: 44.0,
                      left: 44.0,
                      bottom: 100.0,
                    ),
                    sliver: SliverGrid.builder(
                      itemCount: 5,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 228.0,
                      ),
                      itemBuilder: (context, index) {
                        return const BasketCart();
                      },
                    ),
                  ),
                ],
              ),
              const BuyButton()
            ],
          ),
        ),
      ),
    );
  }
}

class BuyButton extends StatelessWidget {
  const BuyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20.0,
      right: 44.0,
      left: 44.0,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 53.0,
          decoration: BoxDecoration(
            color: CustomColor.green,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              'ادامه فرایند خرید',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}

class BasketCart extends StatelessWidget {
  const BasketCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.5,
            spreadRadius: 0.5,
            color: CustomColor.gray,
          )
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset('assets/images/product.png'),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'اسم محصول',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Text(
                            'گارانتی',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '1600000 تومان',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              CustomBadge(
                                content: '0',
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: CustomColor.gray,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      15,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'رنگ و اینا',
                                      style: TextStyle(
                                        color: CustomColor.gray,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const DottedDashedLine(
            height: 0,
            width: double.infinity,
            axis: Axis.horizontal,
            dashColor: CustomColor.gray,
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '120000 تومان',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
