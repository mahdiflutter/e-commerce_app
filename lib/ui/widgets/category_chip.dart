import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
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
              color: CustomColor.green,
              shadows: const [
                BoxShadow(
                  color: CustomColor.green,
                  blurRadius: 10.0,
                  spreadRadius: 0.5,
                  offset: Offset(0, 1),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            'آیفون',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
