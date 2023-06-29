import 'package:e_commerce_app/ui/widgets/header.dart';
import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CustomColor.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const Header(title: 'پروفایل'),
              SliverPadding(
                padding: const EdgeInsets.only(
                  right: 44.0,
                  left: 44.0,
                  bottom: 20.0,
                ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Text(
                        'محمد مهدی حیدری',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        '09214840491',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 44.0),
                sliver: SliverToBoxAdapter(
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runSpacing: 10,
                    spacing: 20,
                    children: [
                      MenuItem(),
                      MenuItem(),
                      MenuItem(),
                      MenuItem(),
                      MenuItem(),
                      MenuItem(),
                      MenuItem(),
                      MenuItem(),
                      MenuItem(),
                      MenuItem(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        // left: 20,
        bottom: 20,
      ),
      child: Column(
        children: [
          Container(
            width: 56.0,
            height: 56.0,
            decoration: ShapeDecoration(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              color: CustomColor.blue,
              shadows: const [
                BoxShadow(
                  color: CustomColor.blue,
                  blurRadius: 10.0,
                  spreadRadius: 0.5,
                  offset: Offset(
                    0,
                    5,
                  ),
                )
              ],
            ),
            child: const Center(
              child: Icon(
                Iconsax.box,
                color: Colors.white,
                size: 35.0,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'سفارشات اخیر',
            style: TextStyle(
              fontFamily: 'shb',
            ),
          )
        ],
      ),
    );
  }
}
