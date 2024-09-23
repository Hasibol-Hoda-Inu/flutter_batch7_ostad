import 'package:bmi_calculator/presentation/utility/app_color.dart';
import 'package:flutter/material.dart';

class ResultOutputScreen extends StatelessWidget {
  const ResultOutputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(children: [Text('BMI ', style: TextStyle(fontWeight: FontWeight.bold),), Text('Calculator')],),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 60,),
            Container(
              decoration: BoxDecoration(
                color: customColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Row(
                      children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('Diana Johns', style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),),
                        Text('Dinajpur, Dhaka, Bangladesh', style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                        ),),
                        SizedBox(height: 32,),
                          Text('16.5', style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.bold
                        ),),
                        Text('BMI Score', style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                        ),),
                      ],),
                      Column(children: [
                        Image.asset("assets/images/man.png")
                      ],),
                    ],),
                    const SizedBox(height: 40,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                          Text('23 yrs', style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w800
                          ),),
                          Text('Age', style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                          ),),
                        ],),
                        Column(
                          children: [
                          Text('172 cm', style:TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w800
                          ),),
                          Text('Height',style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),),
                        ],),
                        Column(
                          children: [
                          Text('60 kg', style: TextStyle(
                        color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w800
                        ),),
                          Text('Weight', style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),),
                        ],),
                      ],),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
