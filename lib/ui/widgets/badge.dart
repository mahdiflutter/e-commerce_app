import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  const CustomBadge({
    super.key,
    required this.content,
  });
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 20,
      decoration: BoxDecoration(
        color: CustomColor.red,
        borderRadius: BorderRadiusDirectional.circular(8.0),
      ),
      child: Center(
        child: Text(
          '$content %',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
