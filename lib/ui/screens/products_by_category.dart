import 'package:e_commerce_app/ui/widgets/header.dart';
import 'package:e_commerce_app/ui/widgets/product_cart.dart';
// import 'package:e_commerce_app/ui/widgets/product_cart.dart';
import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  const ProductsByCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CustomColor.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const Header(title: 'پرفروش ترین '),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 44.0,
                ),
                sliver: SliverGrid.builder(
                  itemCount: 100,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    mainAxisExtent: 216,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Text('00');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
