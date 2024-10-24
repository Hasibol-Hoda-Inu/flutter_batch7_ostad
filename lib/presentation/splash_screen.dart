import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
              end: Alignment(0.1, 1),
              colors: <Color>[
                Color(0xff0172B2),
                Color(0xff001645),
              ]
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: 40,),
            const Text("Find your dream", style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),),
            const Text("Destination with us", style: TextStyle(
              color: Colors.white,
              fontSize: 18
            ),),
          ],),
      ),
    );
  }
}
