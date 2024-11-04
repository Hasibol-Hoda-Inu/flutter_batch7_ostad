import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getx_controller.dart';
import 'home_screen.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomeScreen(),
      initialBinding: ControllerBinder(),
    );
  }
}

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(CounterController());
  }

}
