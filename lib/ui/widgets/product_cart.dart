import 'package:e_commerce_app/ui/widgets/badge.dart';
import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({
    super.key,
    required this.hasPadding,
  });
  final hasPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      margin: EdgeInsets.only(
        left: hasPadding ? 20.0 : 0.0,
        right: hasPadding ? 10.0 : 0.0,
        top: hasPadding ? 20.0 : 0.0,
        bottom: hasPadding ? 20.0 : 0.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 124.0,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset('assets/images/product.png'),
                const Positioned(
                  top: 15,
                  right: 10,
                  child: Icon(
                    Icons.bookmark_border_rounded,
                    color: CustomColor.blue,
                    size: 30.0,
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  left: 10,
                  child: CustomBadge(),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Text(
              'آیفون 13 پرو',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: CustomColor.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15.0,
                    color: CustomColor.gray,
                    offset: Offset(0, 5),
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(
                      Iconsax.arrow_circle_right,
                      color: CustomColor.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '26,000,000',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        '26,000,000',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      'تومان',
                      style: TextStyle(
                        color: CustomColor.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
