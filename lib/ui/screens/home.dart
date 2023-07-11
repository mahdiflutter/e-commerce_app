import 'package:e_commerce_app/bloc/home/home_bloc.dart';
import 'package:e_commerce_app/bloc/home/home_event.dart';
import 'package:e_commerce_app/bloc/home/home_state.dart';
import 'package:e_commerce_app/data/model/category.dart';
import 'package:e_commerce_app/data/model/product.dart';
import 'package:e_commerce_app/ui/widgets/banner_slider.dart';
import 'package:e_commerce_app/ui/widgets/category_chip.dart';
import 'package:e_commerce_app/ui/widgets/product_cart.dart';
import 'package:e_commerce_app/ui/widgets/spinner.dart';
import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<HomeBloc>(context).add(
      HomeSendRequestEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CustomColor.white,
        body: SafeArea(child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                if (state is HomeLoadingState) ...[
                  const Spinner(),
                ],
                if (state is HomeResponseState) ...[
                  const SearchBox(),
                  state.banners.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (r) {
                    return BannerSlider(
                      banners: r,
                    );
                  }),
                  state.categories.fold(
                    (l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    },
                    (r) {
                      return CategoriesSlider(categories: r);
                    },
                  ),
                  state.firstProducts.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (r) {
                    return ProductsList(title: 'پرفروش ترین ها🔥', products: r);
                  }),
                  state.secondProducts.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (r) {
                    return ProductsList(
                        title: 'پربازدید ترین ها🔍', products: r);
                  })
                  // ProductsList(title: 'پربازدید ترین ها🔍'),
                ]
              ],
            );
          },
        )),
      ),
    );
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
    required this.title,
    required this.products,
  });
  final String title;
  final List<ProductModel> products;

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
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCart(
                    hasPadding: true,
                    product: products[index],
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
    required this.categories,
  });
  final List<CategoryModel> categories;

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
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryChip(
                    index: index,
                    category: categories[index],
                  );
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
