import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/slider_provider.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('building');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider', style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<SliderProvider>(builder: (context, value, child)=>Slider(
                value: value.opacity,
                activeColor: Colors.blueAccent,
                min: 0,
                max: 1,
                onChanged: (changingOpacity){
                  value.changeOpacity(changingOpacity);
                }
            ),),
            Consumer<SliderProvider>(builder: (context, value, child)=> Row(
              children: [
                Expanded(child: Container(
                  height: 100,
                  color: Colors.green.withOpacity(value.opacity),
                )),
                Expanded(child: Container(
                  height: 100,
                  color: Colors.blueAccent.withOpacity(value.opacity),
                )),
              ],
            ),),
          ],
        ),
      ),
    );
  }
}
