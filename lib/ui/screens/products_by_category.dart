import 'package:e_commerce_app/bloc/productsbycategory/productsbycategory_bloc.dart';
import 'package:e_commerce_app/bloc/productsbycategory/productsbycategory_event.dart';
import 'package:e_commerce_app/bloc/productsbycategory/productsbycategory_state.dart';
import 'package:e_commerce_app/data/model/category.dart';
import 'package:e_commerce_app/ui/widgets/header.dart';
import 'package:e_commerce_app/ui/widgets/product_cart.dart';
import 'package:e_commerce_app/ui/widgets/spinner.dart';
// import 'package:e_commerce_app/ui/widgets/product_cart.dart';
import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsByCategoryScreen extends StatefulWidget {
  final CategoryModel category;
  const ProductsByCategoryScreen({super.key, required this.category});

  @override
  State<ProductsByCategoryScreen> createState() =>
      _ProductsByCategoryScreenState();
}

class _ProductsByCategoryScreenState extends State<ProductsByCategoryScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductsByCategoryBloc>(context).add(
      ProductsByCategorySendReqEvent(categoryId: widget.category.id!),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CustomColor.white,
        body: SafeArea(
            child: BlocBuilder<ProductsByCategoryBloc, ProductsByCategoryState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                Header(title: widget.category.title!),
                if (state is ProductsByCategoryLoadingState) ...[
                  const Spinner(),
                ],
                if (state is ProductsByCategoryResponseState) ...[
                  state.productsResponse.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (r) {
                    return SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 44.0,
                      ),
                      sliver: SliverGrid.builder(
                        itemCount: r.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          mainAxisExtent: 216,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return ProductCart(
                              hasPadding: false, product: r[index]);
                        },
                      ),
                    );
                  })
                ],
              ],
            );
          },
        )),
      ),
    );
  }
}
