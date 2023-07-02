import 'package:e_commerce_app/bloc/home/home_bloc.dart';
import 'package:e_commerce_app/service/di.dart';
import 'package:e_commerce_app/ui/screens/basket.dart';
import 'package:e_commerce_app/ui/screens/categories.dart';
import 'package:e_commerce_app/ui/screens/home.dart';
// import 'package:e_commerce_app/ui/screens/introduction.dart';
// import 'package:e_commerce_app/ui/screens/product_detail.dart';
// import 'package:e_commerce_app/ui/screens/products_by_category.dart';
import 'package:e_commerce_app/ui/screens/profile.dart';
import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

void main() {
  initGetIt();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int screen = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            fontFamily: 'shb',
            fontSize: 12,
            color: CustomColor.gray,
          ),
          labelMedium: TextStyle(
            color: CustomColor.blue,
            fontSize: 12.0,
            fontFamily: 'shb',
          ),
          labelLarge: TextStyle(
            color: Colors.black,
            fontFamily: 'shb',
            fontSize: 12,
          ),
          labelSmall: TextStyle(
            color: Colors.white,
            fontFamily: 'shb',
            fontSize: 10,
          ),
          displayLarge: TextStyle(
            fontFamily: 'shm',
            fontSize: 14,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontFamily: 'shm',
            fontSize: 16,
          ),
          headlineLarge: TextStyle(
            color: Colors.black,
            fontFamily: 'shb',
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'shm',
          ),
          bodySmall: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'shm',
            decoration: TextDecoration.lineThrough,
          ),
          titleLarge: TextStyle(
            fontFamily: 'shb',
            fontSize: 16,
            color: CustomColor.blue,
          ),
        ),
      ),
      home: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  screen = value;
                });
              },
              currentIndex: screen,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: CustomColor.gray,
              showUnselectedLabels: true,
              selectedItemColor: CustomColor.blue,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Iconsax.home,
                  ),
                  activeIcon: Icon(Iconsax.home_25),
                  label: 'خانه',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Iconsax.category,
                  ),
                  activeIcon: Icon(Iconsax.category_25),
                  label: 'دسته بندی',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Iconsax.shopping_cart,
                  ),
                  activeIcon: Icon(Iconsax.shopping_cart5),
                  label: 'سبد خرید',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Iconsax.personalcard,
                  ),
                  activeIcon: Icon(Iconsax.personalcard5),
                  label: 'حساب کاربری',
                ),
                // BottomNavigationBarItem(icon: icon)
              ],
            ),
            body: IndexedStack(
              index: screen,
              children: getScreens(),
            ),
          )),
    );
  }

  List<Widget> getScreens() {
    return [
      BlocProvider(
        create: (context) => HomeBloc(),
        child: const HomeScreen(),
      ),
      CategoriesScreen(),
      BasketScreen(),
      ProfileScreen(),
    ];
  }
}
