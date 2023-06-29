import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        top: 20,
        right: 44.0,
        left: 44.0,
        bottom: 32.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
          height: 46.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(15),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4.0,
                color: Colors.grey,
                spreadRadius: 0.5,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Positioned(
                left: 15,
                child: Icon(
                  Icons.apple,
                  color: CustomColor.blue,
                  size: 25.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
