import 'package:favorite_aplication_with_provider/provider/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeingScreen extends StatelessWidget {
  const ThemeingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // final themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Consumer<ThemeChanger>(builder: (context, value, child)=>
                RadioListTile(
                    title: const Text("Light Mode"),
                    value: ThemeMode.light,
                    groupValue: value.themeMode,
                    onChanged: value.setTheme),),
            Consumer<ThemeChanger>(builder: (context, value, child)=>
                RadioListTile(
                    title: const Text("Dark Mode"),
                    value: ThemeMode.dark,
                    groupValue: value.themeMode,
                    onChanged: value.setTheme),),
            Consumer<ThemeChanger>(builder: (context, value, child)=>
                RadioListTile(
                    title: const Text("System"),
                    value: ThemeMode.system,
                    groupValue: value.themeMode,
                    onChanged: value.setTheme),)
          ],
        ),
      ),
    );
  }
}
