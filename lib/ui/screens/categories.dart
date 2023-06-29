import 'package:e_commerce_app/ui/widgets/header.dart';
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
              const Header(title: 'دسته بندی ها'),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 44.0,
                ),
                sliver: SliverGrid.builder(
                  itemCount: 8,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: CustomColor.gray,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
