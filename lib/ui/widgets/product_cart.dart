import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/data/model/product.dart';
import 'package:e_commerce_app/ui/widgets/badge.dart';
import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({
    super.key,
    required this.hasPadding,
    required this.product,
  });
  final bool hasPadding;
  final ProductModel product;

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
                SizedBox(
                  width: 80.0,
                  height: 104.0,
                  child: CachedNetworkImage(imageUrl: product.thumbnail!),
                ),
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
                  child: CustomBadge(
                    content: product.persent.toString(),
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
              product.name!,
              style: Theme.of(context).textTheme.displayLarge,
              overflow: TextOverflow.ellipsis,
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
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (product.price).toString(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        (product.price! + product.discountPrice!).toString(),
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
