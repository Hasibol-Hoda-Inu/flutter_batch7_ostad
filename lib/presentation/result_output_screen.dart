import 'dart:core';
import 'package:bmi_calculator/presentation/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultOutputScreen extends StatelessWidget {
  const ResultOutputScreen({
    super.key,
    required this.name,
    required this.address,
    required this.height,
    required this.weight,
    required this.age,
    required this.bmi
  });

  final String name;
  final String address;
  final double height;
  final double weight;
  final int age;
  final double bmi;

  @override
  Widget build(BuildContext context) {

    Map<String, String> bmiData = imageChangeOnBmi(bmi);

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
        child: SingleChildScrollView(
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
                          Expanded(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name, style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                            ),),
                              Text(address, style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),),
                            const SizedBox(height: 32,),
                              Text(bmi.toStringAsFixed(2), style: const TextStyle(
                              color: Colors.white,
                              fontSize: 42,
                              fontWeight: FontWeight.bold
                            ),),
                            const Text('BMI Score', style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),),
                                                  ],),
                          ),
                          Column(children: [
                            SvgPicture.asset(bmiData["img"]!, height: 200,)
                        ],),
                      ],),
                      const SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                            Text(age.toString(), style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w800
                            ),),
                            const Text("Age", style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),),
                          ],),
                          Container(
                            width: 2,
                            height: 50,
                            color: Colors.white,
                          ),
                          Column(
                            children: [
                            Text(height.toString(), style:const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w800
                            ),),
                            const Text('Height',style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),),
                          ],),
                          Container(
                            width: 2,
                            height: 50,
                            color: Colors.white,
                          ),
                          Column(
                            children: [
                            Text(weight.toString(), style: const TextStyle(
                          color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w800
                          ),),
                            const Text('Weight', style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),),
                          ],),
                        ],),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: const Color(0xff001524),
                  borderRadius: BorderRadius.circular(40),

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(bmiData['status']!, style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 24,
                    fontWeight: FontWeight.w800
                  ),),
                  Text(bmiData['comment']!, style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16
                  ),),
                  const SizedBox(height: 40,),
                  Text(bmiData['statement']!, style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16
                  ),),
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }

  Map<String, String> imageChangeOnBmi(double bmi) {
    if(bmi<=18.5){
      return {
        "img": "assets/images/underweight.svg",
        "status": "Underweight",
        "comment": "BMI is less than 18.5",
        "statement": "Being underweight may increase the risk of malnutrition, weakened immunity, and osteoporosis.",
      };
    }else if(bmi >18.5 && bmi<=25){
      return {
        "img": "assets/images/healthy.svg",
        "status": "Healthy weight",
        "comment": "BMI is less than 25",
        "statement": "A healthy weight reduces the risk of heart disease, stroke, and diabetes.",
      };
    }else if(bmi>25 && bmi<=30){
      return {
        "img": "assets/images/overweight.svg",
        "status": "Overweight",
        "comment": "BMI is between 25 and 29.9",
        "statement": "Being underweight may indicate insufficient body fat and muscle mass, which can lead to weakened immune function",
      };
    }else{
      return {
        "img": "assets/images/obese.svg",
        "status": "Obese",
        "comment": "BMI is 30 or higher",
        "statement": "Obesity increases the risk of severe health problems such as heart disease, diabetes, and certain cancers.",
      };
    }
  }

}
