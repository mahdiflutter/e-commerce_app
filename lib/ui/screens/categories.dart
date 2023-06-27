import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CustomColor.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 44.0,
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
                          'دسته بندی ها',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
