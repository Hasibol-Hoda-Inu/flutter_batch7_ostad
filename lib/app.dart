import 'package:barikoi_map_practice/presentation/simple_map.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SimpleMap(),
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
    );
  }
}
