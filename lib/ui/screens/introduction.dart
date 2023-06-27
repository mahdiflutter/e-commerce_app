import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart'; // <------------ import iconsax

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(
                0xff58AEE8,
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff58AEE8),
                  Color(0xff3B5EDF),
                ],
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 44.0,
                      ),
                      child: Image.asset(
                        'assets/images/circles.png',
                      ),
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/apple.png',
                          width: 85.0,
                          height: 103.0,
                        ),
                        const Text(
                          'اپل شاپ',
                          style: TextStyle(
                            fontFamily: 'lalezar',
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'اوج هیجان',
                        style: TextStyle(
                          fontFamily: 'shb',
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'با خرید محصولات',
                        style: TextStyle(
                          fontFamily: 'shb',
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'اپل!',
                        style: TextStyle(
                          fontFamily: 'shb',
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('object');
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: const Color(0xff253DEE),
            ),
          ),
          const Icon(
            Icons.arrow_circle_right_rounded,
            size: 60,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
