import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/bloc/basket/basket_bloc.dart';
import 'package:e_commerce_app/bloc/basket/basket_event.dart';
import 'package:e_commerce_app/bloc/detailproduct/detailproduct_bloc.dart';
import 'package:e_commerce_app/bloc/detailproduct/detailproduct_event.dart';
import 'package:e_commerce_app/bloc/detailproduct/detailproduct_state.dart';
import 'package:e_commerce_app/data/model/product.dart';
import 'package:e_commerce_app/data/model/product_image.dart';
import 'package:e_commerce_app/data/model/productvariant.dart';
import 'package:e_commerce_app/data/model/property.dart';
import 'package:e_commerce_app/data/model/variant.dart';
import 'package:e_commerce_app/data/model/variant_type.dart';
import 'package:e_commerce_app/ui/widgets/badge.dart';
import 'package:e_commerce_app/ui/widgets/header.dart';
import 'package:e_commerce_app/ui/widgets/spinner.dart';
import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = DetailProductBloc();
        bloc.add(
          DetailProductSendRequestEvent(
              productId: widget.product.id!,
              categoryId: widget.product.category!),
        );
        return bloc;
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: CustomColor.white,
          body: SafeArea(
            child: BlocBuilder<DetailProductBloc, DetailProductState>(
              builder: (context, state) {
                return CustomScrollView(
                  slivers: [
                    if (state is DetailProductLoadingState) ...[
                      const Spinner(),
                    ],
                    if (state is DetailProductResponseState) ...[
                      state.categoryResponse.fold((l) {
                        return SliverToBoxAdapter(
                          child: Text(l),
                        );
                      }, (r) {
                        return Header(
                          title: r.title!,
                        );
                      }),

                      SliverToBoxAdapter(
                        child: Text(
                          widget.product.name!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      state.images.fold(
                        (l) {
                          return SliverToBoxAdapter(
                            child: Text(l),
                          );
                        },
                        (r) => ProductGallery(
                          images: r,
                          mainImage: widget.product.thumbnail!,
                        ),
                      ),
                      state.productVariants.fold(
                        (l) {
                          return SliverToBoxAdapter(
                            child: Text(l),
                          );
                        },
                        (productVariants) => VariantContainer(
                          productVariants: productVariants,
                        ),
                      ),
                      //  const SelectMemory(),
                      CustomDropDown(
                        description: widget.product.description!,
                        title: 'توضیحات محصول',
                      ),
                      state.properties.fold((l) {
                        return SliverToBoxAdapter(
                          child: Text(l),
                        );
                      }, (r) {
                        if (r.isNotEmpty) {
                          return PropertiesDropDown(properties: r);
                        } else {
                          return const SliverToBoxAdapter(
                            child: Row(),
                          );
                        }
                      }),
                      FooterSection(product: widget.product),

                      // CustomDropDown(description: widget.product.description!),
                      // const CustomDropDown(),
                      // const CustomDropDown(),
                    ],
                    if (state is AddedToBasketState) ...[
                      state.categoryResponse.fold((l) {
                        return SliverToBoxAdapter(
                          child: Text(l),
                        );
                      }, (r) {
                        return Header(
                          title: r.title!,
                        );
                      }),

                      SliverToBoxAdapter(
                        child: Text(
                          widget.product.name!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      state.images.fold(
                        (l) {
                          return SliverToBoxAdapter(
                            child: Text(l),
                          );
                        },
                        (r) => ProductGallery(
                          images: r,
                          mainImage: widget.product.thumbnail!,
                        ),
                      ),
                      state.productVariants.fold(
                        (l) {
                          return SliverToBoxAdapter(
                            child: Text(l),
                          );
                        },
                        (productVariants) => VariantContainer(
                          productVariants: productVariants,
                        ),
                      ),
                      //  const SelectMemory(),
                      CustomDropDown(
                        description: widget.product.description!,
                        title: 'توضیحات محصول',
                      ),
                      state.properties.fold((l) {
                        return SliverToBoxAdapter(
                          child: Text(l),
                        );
                      }, (r) {
                        if (r.isNotEmpty) {
                          return PropertiesDropDown(properties: r);
                        } else {
                          return const SliverToBoxAdapter(
                            child: Row(),
                          );
                        }
                      }),
                      const SuccessedAdd()
                    ],
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SuccessedAdd extends StatelessWidget {
  const SuccessedAdd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 20),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Text(
              'با موفقیت به سبد خرید اضافه شد.',
              style: TextStyle(
                color: CustomColor.green,
                fontSize: 16,
                fontFamily: 'shb',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  final ProductModel product;
  const FooterSection({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        left: 44.0,
        right: 44.0,
        bottom: 32.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            //https://github.com/amirahmadadibi/ecommerce_project/blob/main/lib/screens/product_detail_screen.dart at line 650
            AddToBasketButton(product: product),
            const SizedBox(
              width: 15.0,
            ),
            PriceButton(
              discount: product.persent!,
              realPrice: product.price!,
              discountPrice: product.discountPrice!,
            ),
          ],
        ),
      ),
    );
  }
}

class PriceButton extends StatelessWidget {
  final num discount;
  final int realPrice;
  final int discountPrice;
  const PriceButton({
    super.key,
    required this.discount,
    required this.realPrice,
    required this.discountPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            child: Container(
              width: 130.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: CustomColor.green,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 160.0,
                  height: 53.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomBadge(content: discount.toString()),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            realPrice.toString(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            (realPrice + discountPrice).toString(),
                            style: const TextStyle(
                              fontFamily: 'shb',
                              color: CustomColor.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'تومان',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddToBasketButton extends StatelessWidget {
  final ProductModel product;
  const AddToBasketButton({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: InkWell(
        onTap: () {
          BlocProvider.of<DetailProductBloc>(context).add(
            AddToBasketEvent(
              product: product,
            ),
          );
          BlocProvider.of<BasketBloc>(context).add(
            BasketSendRequestEvent(),
          );
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              child: Container(
                width: 130.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: CustomColor.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Positioned(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: 160.0,
                    height: 53.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    child: const Center(
                      child: Text(
                        'افزودن به سبد خرید',
                        style: TextStyle(
                          fontFamily: 'shb',
                          fontSize: 16,
                          color: CustomColor.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropDown extends StatefulWidget {
  final String description;
  final String title;
  const CustomDropDown({
    super.key,
    required this.description,
    required this.title,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        left: 44.0,
        right: 44.0,
        bottom: 20.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isOpen = !isOpen;
                });
              },
              child: Container(
                width: double.infinity,
                height: 46.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: CustomColor.gray),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Text(widget.title),
                    const Spacer(),
                    Text(
                      'مشاهده',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      isOpen
                          ? Iconsax.arrow_circle_down
                          : Iconsax.arrow_circle_left,
                      color: CustomColor.blue,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Visibility(
              visible: isOpen,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: CustomColor.gray),
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.description,
                  style: const TextStyle(
                    height: 1.7,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PropertiesDropDown extends StatefulWidget {
  final List<PropertyModel> properties;

  const PropertiesDropDown({
    super.key,
    required this.properties,
  });

  @override
  State<PropertiesDropDown> createState() => _PropertiesDropDownState();
}

class _PropertiesDropDownState extends State<PropertiesDropDown> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        left: 44.0,
        right: 44.0,
        bottom: 20.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isOpen = !isOpen;
                });
              },
              child: Container(
                width: double.infinity,
                height: 46.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: CustomColor.gray),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    const Text('مشخصات فنی'),
                    const Spacer(),
                    Text(
                      'مشاهده',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      isOpen
                          ? Iconsax.arrow_circle_down
                          : Iconsax.arrow_circle_left,
                      color: CustomColor.blue,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Visibility(
              visible: isOpen,
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: CustomColor.gray),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      for (var property in widget.properties)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              Text(property.title!),
                              const Text(":"),
                              Text(property.value!),
                            ],
                          ),
                        )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectMemory extends StatelessWidget {
  const SelectMemory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 44.0,
        vertical: 20.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('انتخاب حافظه داخلی'),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 74,
                  height: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                      color: CustomColor.gray,
                    ),
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProductGallery extends StatefulWidget {
  const ProductGallery({
    super.key,
    required this.images,
    required this.mainImage,
  });
  final List<ProductImageModel> images;
  final String mainImage;

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  bool isMainImage = true;
  int imageSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 44.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
          height: 284.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(15),
            boxShadow: const [
              BoxShadow(
                color: CustomColor.gray,
                blurRadius: 10.0,
              )
            ],
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Iconsax.save_2,
                      ),
                      SizedBox(
                        width: 101.0,
                        height: 148.0,
                        child: CachedNetworkImage(
                          imageUrl: isMainImage
                              ? widget.mainImage
                              : widget.images[imageSelected].thumbnail,
                        ),
                      ),
                      const Row(
                        children: [
                          Text('4'),
                          SizedBox(width: 10),
                          Icon(
                            Iconsax.star,
                            color: Colors.amber,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 45,
                  ),
                  child: SizedBox(
                    height: 90.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.images.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isMainImage = false;
                                  imageSelected = index;
                                });
                              },
                              child: Container(
                                width: 70.0,
                                height: 70.0,
                                margin: const EdgeInsets.only(
                                  right: 20,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: imageSelected == index &&
                                            isMainImage == false
                                        ? 2
                                        : 1,
                                    color: imageSelected == index &&
                                            isMainImage == false
                                        ? CustomColor.blue
                                        : CustomColor.gray,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CachedNetworkImage(
                                      imageUrl: widget.images[index].thumbnail,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VariantContainer extends StatelessWidget {
  const VariantContainer({
    super.key,
    required this.productVariants,
  });
  final List<ProductVariantModel> productVariants;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 44.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (var i in productVariants)
              VariantGenerator(
                productVariant: i,
              ),
          ],
        ),
      ),
    );
  }
}

class VariantGenerator extends StatelessWidget {
  final ProductVariantModel productVariant;
  const VariantGenerator({
    super.key,
    required this.productVariant,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (productVariant.variants.isNotEmpty) ...[
          Row(
            children: [
              Text(productVariant.variantType.title),
            ],
          ),
          const SizedBox(height: 10),
          if (productVariant.variantType.type == Types.COLOR) ...[
            ColorGenerator(colorsList: productVariant.variants)
          ],
          if (productVariant.variantType.type == Types.STORAGE) ...[
            StorageGenerator(storagesList: productVariant.variants)
          ],
          const SizedBox(height: 10),
        ]
      ],
    );
  }
}

class ColorGenerator extends StatefulWidget {
  final List<VariantModel> colorsList;
  const ColorGenerator({
    super.key,
    required this.colorsList,
  });

  @override
  State<ColorGenerator> createState() => _ColorGeneratorState();
}

class _ColorGeneratorState extends State<ColorGenerator> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.colorsList.length,
        itemBuilder: (context, index) {
          String stringColor = 'ff${widget.colorsList[index].value}';
          int intColor = int.parse(stringColor, radix: 16);
          return InkWell(
            onTap: () {
              setState(() {
                selected = index;
              });
            },
            child: AnimatedContainer(
              width: selected == index ? 60 : 26,
              margin: const EdgeInsets.only(left: 10),
              height: 26.0,
              curve: Curves.linearToEaseOut,
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(intColor),
              ),
              child: Center(
                child: Text(
                  selected == index ? widget.colorsList[index].name : '',
                  style: const TextStyle(
                    color: CustomColor.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class StorageGenerator extends StatefulWidget {
  final List<VariantModel> storagesList;
  const StorageGenerator({super.key, required this.storagesList});

  @override
  State<StorageGenerator> createState() => _StorageGeneratorState();
}

class _StorageGeneratorState extends State<StorageGenerator> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.storagesList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                selected = index;
              });
            },
            child: AnimatedContainer(
              margin: const EdgeInsets.only(
                left: 10,
              ),
              width: 74,
              duration: const Duration(microseconds: 300),
              curve: Curves.linear,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color:
                      selected == index ? CustomColor.blue : CustomColor.gray,
                ),
                color: Colors.white,
              ),
              child: Center(
                child: Text(widget.storagesList[index].value),
              ),
            ),
          );
        },
      ),
    );
  }
}
