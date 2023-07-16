import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:e_commerce_app/bloc/basket/basket_bloc.dart';
import 'package:e_commerce_app/bloc/basket/basket_event.dart';
// import 'package:e_commerce_app/bloc/basket/basket_event.dart';
import 'package:e_commerce_app/bloc/basket/basket_state.dart';
import 'package:e_commerce_app/data/model/order.dart';
import 'package:e_commerce_app/ui/widgets/badge.dart';
import 'package:e_commerce_app/ui/widgets/header.dart';
import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zarinpal/zarinpal.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  PaymentRequest _paymentRequest = PaymentRequest();
  @override
  void initState() {
    _paymentRequest.setIsSandBox(true);
    _paymentRequest.setAmount(1000);
    _paymentRequest.setDescription('a test');
    _paymentRequest.setCallbackURL('appleshop://store');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: CustomColor.white,
            body: SafeArea(
              child: Stack(
                children: [
                  if (state is BasketResponseState) ...[
                    CustomScrollView(
                      slivers: [
                        const Header(title: 'سبد خرید'),
                        SliverPadding(
                          padding: const EdgeInsets.only(
                            right: 44.0,
                            left: 44.0,
                            bottom: 100.0,
                          ),
                          sliver: state.ordersResponse.fold((l) {
                            return SliverToBoxAdapter(
                              child: Text(l),
                            );
                          }, (orders) {
                            return SliverGrid.builder(
                              itemCount: orders.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 20,
                                mainAxisExtent: 228.0,
                              ),
                              itemBuilder: (context, index) {
                                return BasketCart(order: orders[index]);
                              },
                            );
                          }),
                        )
                      ],
                    ),
                    BuyButton(totalPrice: state.totalOrders),
                  ],

                  // if (state is BasketResponseState) ...[
                  //
                  // ]
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class BuyButton extends StatelessWidget {
  final int totalPrice;
  const BuyButton({
    super.key,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20.0,
      right: 44.0,
      left: 44.0,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 53.0,
          decoration: BoxDecoration(
            color: CustomColor.green,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              ' $totalPrice پرداخت ',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}

class BasketCart extends StatelessWidget {
  final OrderModel order;
  const BasketCart({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 0.5,
            color: CustomColor.gray,
          )
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CachedNetworkImage(imageUrl: order.thumbnail!),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<BasketBloc>(context).add(
                                BasketIncreaseCountEvent(order: order),
                              );
                            },
                            padding: const EdgeInsets.all(0),
                            icon: const Icon(
                              Icons.add,
                              color: CustomColor.green,
                            ),
                          ),
                          Text(
                            '${order.count}',
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (order.count != 1) {
                                BlocProvider.of<BasketBloc>(context).add(
                                  BasketDecreaseCountEvent(order: order),
                                );
                              } else {
                                BlocProvider.of<BasketBloc>(context).add(
                                  BasketDeleteOrderEvent(order: order),
                                );
                              }
                            },
                            padding: const EdgeInsets.all(0),
                            icon: Icon(
                              order.count == 1
                                  ? Icons.delete_outline_rounded
                                  : Icons.remove,
                              color: CustomColor.red,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.name!,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Text(
                            order.garanty!,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '${order.realPrice} تومان',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              const SizedBox(width: 5),
                              CustomBadge(
                                content: order.persent!.toString(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const DottedDashedLine(
            height: 0,
            width: double.infinity,
            axis: Axis.horizontal,
            dashColor: CustomColor.gray,
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '${(order.realPrice! + order.discountPrice!) * order.count!} تومان',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
