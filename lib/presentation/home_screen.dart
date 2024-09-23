import 'package:bmi_calculator/presentation/user_input_screen.dart';
import 'package:bmi_calculator/presentation/utility/app_color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Column(
        children: [
          const SizedBox(height: 60,),
          Image.asset("assets/images/fat.png"),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: customColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text('Unveiling the Secrets', style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),),
                  const Text("of Your Body's Balance!", style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),),
                  const SizedBox(height: 80,),
                  const Text('Easily calculate your Body Mass Index (BMI) by entering your height and weight', style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                  const SizedBox(height: 40,),
                  const Divider(thickness: 2,),
                  const SizedBox(height: 40,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserInputScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                          padding: const EdgeInsets.symmetric(vertical: 20)
                        ),

                        child: const Text('Get Started', style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),)),
                  )
                ],),
              ),
            ),
          )
        ],
      ),
    );
  }
}
