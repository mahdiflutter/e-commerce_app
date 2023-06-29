import 'package:e_commerce_app/ui/widgets/banner_slider.dart';
import 'package:e_commerce_app/ui/widgets/category_chip.dart';
import 'package:e_commerce_app/ui/widgets/product_cart.dart';
import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CustomColor.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SearchBox(),
              BannerSlider(),
              CategoriesSlider(),
              ProductsList(title: 'پرفروش ترین ها🔥'),
              ProductsList(title: 'پربازدید ترین ها🔍'),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        right: 44.0,
        top: 32.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'مشاهده همه',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const Icon(
                  Iconsax.arrow_circle_left,
                  color: CustomColor.blue,
                ),
                const SizedBox(
                  width: 44.0,
                ),
              ],
            ),
            SizedBox(
              height: 256.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const ProductCart(
                    hasPadding: true,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoriesSlider extends StatelessWidget {
  const CategoriesSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        right: 44,
        top: 32,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'دسته بندی ها',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'مشاهده همه',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const Icon(
                  Iconsax.arrow_circle_left,
                  color: CustomColor.blue,
                ),
                const SizedBox(
                  width: 44.0,
                ),
              ],
            ),
            SizedBox(
              height: 106.0,
              child: ListView.builder(
                itemCount: 9,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryChip(index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 44,
        vertical: 20,
      ),
      sliver: SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
          height: 46.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                blurRadius: 4.0,
                color: Colors.grey,
                spreadRadius: 0.5,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15, left: 10),
                child: Icon(
                  Iconsax.search_normal_1,
                  size: 25.0,
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'جستجو در محصولات',
                    hintStyle: TextStyle(
                      fontFamily: 'shb',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 10),
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
