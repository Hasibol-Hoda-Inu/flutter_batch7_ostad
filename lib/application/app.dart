import 'package:flutter/material.dart';
import 'package:real_estate_ui/presentation/splash_screen.dart';

import '../presentation/home_screen.dart';

class RealEstate extends StatelessWidget {
  const RealEstate({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
