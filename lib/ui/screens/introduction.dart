import 'package:e_commerce_app/ui/screens/home.dart';
import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';

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
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  CustomColor.lightBlue,
                  CustomColor.lightBlue2,
                ],
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 44.0,
                    vertical: 70,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/circles.png',
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
                              color: CustomColor.white,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const MainContainer(
                  contents: ['اوج هیجان', 'با خرید محصولات', 'اپل!'],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainContainer extends StatelessWidget {
  const MainContainer({
    super.key,
    required this.contents,
  });
  final List<String> contents;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (String content in contents)
            Text(
              content,
              style: const TextStyle(
                fontFamily: 'shb',
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            whenClick: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.whenClick});
  final Function whenClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        whenClick();
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
