import 'package:e_commerce_app/ui/screens/categories.dart';
import 'package:e_commerce_app/ui/screens/introduction.dart';
import 'package:e_commerce_app/util/custom_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

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
            bodyMedium: TextStyle(
              color: Colors.white,
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
            )),
      ),
      home: const CategoriesScreen(),
    );
  }
}
