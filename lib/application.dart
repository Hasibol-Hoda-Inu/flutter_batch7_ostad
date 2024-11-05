import 'package:counter_with_getx/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getx_controller.dart';
import 'home_screen.dart';
import 'settings_screen.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomeScreen(),
      initialBinding: ControllerBinder(),
      initialRoute: "/",
      routes: {
        HomeScreen.name :(context)=>const HomeScreen(),
        SettingsScreen.name :(context)=>const SettingsScreen(),
        ProfileScreen.name :(context)=>const ProfileScreen(),
      },
    );
  }
}

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(CounterController());
  }

}
