import 'dart:math';

import 'package:bmi_calculator/application/app.dart';
import 'package:bmi_calculator/presentation/result_output_screen.dart';
import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class UserInputWidget extends StatelessWidget {
   UserInputWidget({
    super.key,
  });

  TextEditingController yourNameTEcontroller = TextEditingController();
  TextEditingController yourAddressTEcontroller = TextEditingController();
  TextEditingController yourAgeTEcontroller = TextEditingController();
  TextEditingController yourHeightTEcontroller = TextEditingController();
  TextEditingController yourWeightTEcontroller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const Text('Your Name', style: TextStyle(
            fontSize: 18,
          ),),
              const SizedBox(height: 12,),
              TextFormField(
                controller: yourNameTEcontroller,
                validator: (String? value){
                  if(value == null || value.isEmpty){
                return "Input a valid value";
              }
            },
            decoration: const InputDecoration(),),
              const SizedBox(height: 24,),
              const Text('Address', style: TextStyle(
            fontSize: 18,
          ),),
              const SizedBox(height: 12,),
              TextFormField(
                controller: yourAddressTEcontroller,
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return "Enter a valid Value";
              }
            },
            decoration: const InputDecoration(),
          ),
              const SizedBox(height: 24,),
              const Text('Your Age', style: TextStyle(
            fontSize: 18,
          ),),
              const SizedBox(height: 12,),
              TextFormField(
                controller: yourAgeTEcontroller,
                keyboardType: TextInputType.number,
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return "Enter a valid value";
              }
            },
            decoration: const InputDecoration(),),
              const SizedBox(height: 24,),
              const Text('Select Gender', style: TextStyle(
            fontSize: 18,
          ),),
              const SizedBox(height: 12,),
              Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffe2eaff),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Image.asset("assets/images/Nafiz.png", alignment: Alignment.bottomCenter, ),
                        ),
                      ),
                      const Text('Male', style: TextStyle(
                        fontSize: 18,
                      ),)
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16,),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffe2eaff),
                          ),
                          child: Image.asset("assets/images/sadia.png", alignment: Alignment.bottomCenter, height: 100,),
                        ),
                        const Text('Female', style: TextStyle(
                          fontSize: 18,)),
                      ]
                  ),
                ),
              ),
            ],
          ),
              const SizedBox(height: 24,),
              const Text('Your Height (ft)', style: TextStyle(
            fontSize: 18,
          ),),
              const SizedBox(height: 12,),
              TextFormField(
            controller: yourHeightTEcontroller,
            keyboardType: TextInputType.number,
            validator: (String? value){
              if(value == null || value.isEmpty){
                return "Enter a valid value";
              }
            },
            decoration: const InputDecoration(),),
              const SizedBox(height: 24,),
              const Text('Your Weight (kg)', style: TextStyle(
            fontSize: 18,
          ),),
              const SizedBox(height: 12,),
              TextFormField(
                controller: yourWeightTEcontroller,
                keyboardType: TextInputType.number,
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return "Enter a valid value";
                  }
                  },
                decoration: const InputDecoration(),),
        ],)),
        const SizedBox(height: 34,),
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
              onPressed: () {
               if(_formKey.currentState!.validate()){
                 double bmi = BMIformula();
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                     ResultOutputScreen(
                       name: yourNameTEcontroller.text,
                       address: yourAddressTEcontroller.text,
                       height: double.tryParse(yourHeightTEcontroller.text) ?? 0.0,
                       weight: double.tryParse(yourWeightTEcontroller.text) ?? 0.0,
                       age: int.tryParse(yourAgeTEcontroller.text) ?? 0,
                       bmi: bmi,
                     ))).then((_){
                   clearTextField();
                 });
               }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: customColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text(
                'Calculate BMI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              )),
        ),
      ],
    );
  }

  double BMIformula(){
    double weightInKg = double.tryParse(yourWeightTEcontroller.text) ?? 0.0;
    double heightInft = double.tryParse(yourHeightTEcontroller.text) ?? 0.0;
    double heightInMeeter = heightInft*0.3048;
    double bmi = weightInKg/pow(heightInMeeter, 2);
    return bmi;
  }

  void clearTextField(){
    yourNameTEcontroller.clear();
    yourAddressTEcontroller.clear();
    yourAgeTEcontroller.clear();
    yourHeightTEcontroller.clear();
    yourWeightTEcontroller.clear();
  }

  void dispose(){
    yourNameTEcontroller.dispose();
    yourAddressTEcontroller.dispose();
    yourAgeTEcontroller.dispose();
    yourHeightTEcontroller.dispose();
    yourWeightTEcontroller.dispose();
  }
}