import 'package:bmi_calculator/presentation/result_output_screen.dart';
import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class UserInputWidget extends StatelessWidget {
  const UserInputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Your Name', style: TextStyle(
          fontSize: 18,
        ),),
        const SizedBox(height: 12,), TextFormField(
          decoration: const InputDecoration(),),
        const SizedBox(height: 24,),
        const Text('Address', style: TextStyle(
          fontSize: 18,
        ),),
        const SizedBox(height: 12,),
        TextFormField(
          decoration: const InputDecoration(),
        ),
        const SizedBox(height: 24,),
        const Text('Your Age', style: TextStyle(
          fontSize: 18,
        ),),
        const SizedBox(height: 12,),
        TextFormField(
          keyboardType: TextInputType.number,
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
        const Text('Your Height (cm)', style: TextStyle(
          fontSize: 18,
        ),),
        const SizedBox(height: 12,),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(),),
        const SizedBox(height: 24,),
        const Text('Your Weight (kg)', style: TextStyle(
          fontSize: 18,
        ),),
        const SizedBox(height: 12,),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(),),
        const SizedBox(height: 34,),
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResultOutputScreen()));
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
}