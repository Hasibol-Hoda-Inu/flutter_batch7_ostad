import 'package:firebase_practice/presentation/login_screen.dart';
import 'package:flutter/material.dart';

import '../presentation/utils/app_color.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const LoginScreen(),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: AppColor.primaryColor,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color:AppColor.primaryColor)
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color:AppColor.primaryColor)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color:AppColor.primaryColor)
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color:AppColor.primaryColor)
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                fixedSize: const Size.fromWidth(double.maxFinite),
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: AppColor.primaryColor
            ),
        ),
      ),
    );
  }
}