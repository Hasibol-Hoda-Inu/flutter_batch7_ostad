import 'package:counter_with_getx/getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Getx"),
      ),
      body: Center(
        child: GetBuilder<CounterController>(
          builder: (counterController) {
            return Text("${counterController.counter}",
              style: const TextStyle(
                fontSize: 24,
            ),);
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.find<CounterController>().increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
