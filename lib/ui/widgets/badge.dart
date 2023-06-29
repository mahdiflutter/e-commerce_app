import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  const CustomBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
