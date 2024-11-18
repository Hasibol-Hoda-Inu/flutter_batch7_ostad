import 'package:firebase_practice/presentation/login_screen.dart';
import 'package:flutter/material.dart';

import '../presentation/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: LoginScreen(),
    );
  }
}