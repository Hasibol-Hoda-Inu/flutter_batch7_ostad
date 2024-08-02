import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   final snackBar = SnackBar(
    content: const Text('Button Pressed!'),
     backgroundColor: Colors.green,
     behavior: SnackBarBehavior.floating,
     action: SnackBarAction(label: 'Dismiss', textColor: Colors.yellow, onPressed: (){}),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello, World!', style: TextStyle(
              fontSize: 32,
              color: Colors.red,
              fontWeight: FontWeight.w700
            ),),
            const Text('Welcome to Flutter!'),
            const SizedBox(height: 40,),
            const Image(image: AssetImage('assets/images/profile.png'), height: 200,width: 200,),
            const SizedBox(height: 40,),
            ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green
                ),
                child: const Text('Press Me',
                  style: TextStyle(
                    color: Colors.white
                  ),))
          ],
        ),
      ),
    );
  }
}
