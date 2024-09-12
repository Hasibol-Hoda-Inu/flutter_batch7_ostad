import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trying_new_state_management_tool/provider/count_provider.dart';
import 'package:trying_new_state_management_tool/provider/slider_provider.dart';
import 'package:trying_new_state_management_tool/screens/counter_screen.dart';
import 'package:trying_new_state_management_tool/screens/slider_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>CountProvider()),
          ChangeNotifierProvider(create: (context)=>SliderProvider()),
        ],
            child: const MaterialApp(
              home: SliderScreen(),
            )
    );
  }
}
