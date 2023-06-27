import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 10.0,
        top: 20.0,
        bottom: 20.0,
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
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    width: 25,
                    height: 15,
                    decoration: BoxDecoration(
                      color: CustomColor.red,
                      borderRadius: BorderRadiusDirectional.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        '%3',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  ),
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
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Iconsax.arrow_circle_right,
                      color: CustomColor.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
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
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      'تومان',
                      style: Theme.of(context).textTheme.bodyMedium,
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
