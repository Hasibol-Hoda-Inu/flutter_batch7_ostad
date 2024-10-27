import 'package:flutter/material.dart';

import 'widgets/card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 34),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hi, David 👋", style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                          Text("Explore the world", style: TextStyle(
                            color: Color(0xff888888),
                            fontSize: 20,
                          ),)
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset("assets/images/profile.png"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search places",
                      hintStyle: const TextStyle(color: Color(0xff888888)),
                      suffixIcon: const Icon(Icons.menu, color: Color(0xff888888),),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color(0xffD2D2D2),
                            width: 2,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color(0xffD2D2D2),
                            width: 2,
                          )
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color(0xffD2D2D2),
                            width: 2,
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 42,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Popular places", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      TextButton(
                          onPressed: (){},
                          child: const Text("View all", style: TextStyle(
                            color: Color(0xff888888),
                            fontSize: 16,
                          ),))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff2F2F2F),
                              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )
                          ),
                          child: const Text("Most Viewed", style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),)),
                      ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: const Color(0xffF1F1F1),
                              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )
                          ),
                          child: const Text("Nearby", style: TextStyle(
                            color: Color(0xffBEBEBE),
                            fontSize: 16,
                          ),)),
                      ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: const Color(0xffF1F1F1),
                              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )
                          ),
                          child: const Text("Latest", style: TextStyle(
                            color: Color(0xffBEBEBE),
                            fontSize: 16,
                          ),)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 45,),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 34,),
                  CardWidget(),
                  SizedBox(width: 24,),
                  CardWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

