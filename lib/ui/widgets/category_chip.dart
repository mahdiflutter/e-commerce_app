import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/data/model/category.dart';
import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.index,
    required this.category,
  });
  final int index;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final String stringColor = 'ff${category.color}';
    final int color = int.parse(stringColor, radix: 16);
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: index == 0 ? 10.0 : 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56.0,
            height: 56.0,
            decoration: ShapeDecoration(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Color(color),
              shadows: [
                BoxShadow(
                  color: Color(color),
                  blurRadius: 10.0,
                  spreadRadius: 0.5,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: Center(
              child: SizedBox(
                width: 36.0,
                height: 36.0,
                child: CachedNetworkImage(
                  imageUrl: category.icon!,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            category.title!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
