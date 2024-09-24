import 'dart:math';

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
  TextEditingController yourHeightInFeetTEcontroller = TextEditingController();
  TextEditingController yourHeightInInchTEcontroller = TextEditingController();
  TextEditingController yourWeightTEcontroller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selectGender;

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
                      onTap: () {
                    selectGender = "male";
                  },
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
                  onTap: () {
                    selectGender = "female";
                  },
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
              Row(children: [
                Expanded(
                  child: TextFormField(
                    controller: yourHeightInFeetTEcontroller,
                    keyboardType: TextInputType.number,
                    validator: (String? value){
                      if(value == null || value.isEmpty){
                        return "Enter a valid value";
                      }
                    },

                    decoration: const InputDecoration(
                        hintText: "Feet",
                      hintStyle: TextStyle(
                        color: Colors.grey
                      )
                    ),),
                ),
                const SizedBox(width: 16,),
                Expanded(
                  child: TextFormField(
                    controller: yourHeightInInchTEcontroller,
                    keyboardType: TextInputType.number,
                    validator: (String? value){
                      if(value == null || value.isEmpty){
                        return "Enter a valid value";
                      }
                    },
                    decoration: const InputDecoration(
                        hintText: "Inch",
                      hintStyle: TextStyle(
                        color: Colors.grey
                      )

                    ),),
                ),
              ],),
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
                       height: getTotalHeightInMeters() ?? 0.0,
                       weight: double.tryParse(yourWeightTEcontroller.text) ?? 0.0,
                       age: int.tryParse(yourAgeTEcontroller.text) ?? 0,
                       bmi: bmi,
                       gender: selectGender ?? " ",
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

  double getTotalHeightInMeters(){
    double heightInFeet = double.tryParse(yourHeightInFeetTEcontroller.text) ?? 0.0;
    double heightInInch = double.tryParse(yourHeightInInchTEcontroller.text) ?? 0.0;
    double height = (heightInFeet*12)+heightInInch;
    double heightInMeters = height*0.0254;
    return heightInMeters;
  }
  double BMIformula(){
    double weightInKg = double.tryParse(yourWeightTEcontroller.text) ?? 0.0;
    double heightInMeeter = getTotalHeightInMeters();
    double bmi = weightInKg/pow(heightInMeeter, 2);
    return bmi;
  }


  void clearTextField(){
    yourNameTEcontroller.clear();
    yourAddressTEcontroller.clear();
    yourAgeTEcontroller.clear();
    yourHeightInFeetTEcontroller.clear();
    yourHeightInInchTEcontroller.clear();
    yourWeightTEcontroller.clear();
  }

  void dispose(){
    yourNameTEcontroller.dispose();
    yourAddressTEcontroller.dispose();
    yourAgeTEcontroller.dispose();
    yourHeightInFeetTEcontroller.dispose();
    yourHeightInInchTEcontroller.dispose();
    yourWeightTEcontroller.dispose();
  }
}