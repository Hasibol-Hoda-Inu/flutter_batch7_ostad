import 'package:favorite_aplication_with_provider/provider/favorite_provider.dart';
import 'package:favorite_aplication_with_provider/provider/theme_changer.dart';
import 'package:favorite_aplication_with_provider/screens/themeing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';

class FavoriteApp extends StatelessWidget {
  const FavoriteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => FavoriteProvider()),
          ChangeNotifierProvider(create: (context) => ThemeChanger()),
        ],
        child: Builder(
            builder: (BuildContext context) => Consumer<ThemeChanger>(
                builder: (context, value, child) => MaterialApp(
                      home: const ThemeingScreen(),
                      themeMode: value.themeMode,
                      theme: ThemeData(brightness: Brightness.light),
                      darkTheme: ThemeData(
                        brightness: Brightness.dark,
                      ),
                    ))));
  }
}
