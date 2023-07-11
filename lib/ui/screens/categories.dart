import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/bloc/categories/categories_bloc.dart';
import 'package:e_commerce_app/bloc/categories/categories_event.dart';
import 'package:e_commerce_app/bloc/categories/categories_state.dart';
import 'package:e_commerce_app/bloc/productsbycategory/productsbycategory_bloc.dart';
import 'package:e_commerce_app/ui/screens/products_by_category.dart';
import 'package:e_commerce_app/ui/widgets/header.dart';
import 'package:e_commerce_app/ui/widgets/spinner.dart';
import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CategoriesBloc>(context).add(
      CategoriesSendRequestEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CustomColor.white,
        body: SafeArea(child: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                if (state is CategoriesLoadingState) ...[
                  const Spinner(),
                ],
                if (state is CategoriesResponseState) ...[
                  const Header(title: 'دسته بندی ها'),
                  state.categoriesResponse.fold((l) {
                    return const SliverToBoxAdapter(
                      child: Text('error!'),
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
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return BlocProvider(
                                    create: (context) =>
                                        ProductsByCategoryBloc(),
                                    child: ProductsByCategoryScreen(
                                      category: r[index],
                                    ),
                                  );
                                },
                              ));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(
                                imageUrl: r[index].thumbnail!,
                              ),
                            ),
                          );
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
