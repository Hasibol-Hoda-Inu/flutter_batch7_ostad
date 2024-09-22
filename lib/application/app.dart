import 'package:bmi_calculator/presentation/home_screen.dart';
import 'package:bmi_calculator/presentation/user_input_screen.dart';
import 'package:flutter/material.dart';

import '../presentation/utility/app_color.dart';

class BMIcalculator extends StatelessWidget {
  const BMIcalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UserInputScreen(),
      theme: ThemeData(
        primarySwatch: customColor,
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Color(0x4c4c4ade)
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0x4c4c4ade)
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          fillColor: Color(0xffF5F4FF),
          filled: true,
        )
      ),
    );
  }
}
