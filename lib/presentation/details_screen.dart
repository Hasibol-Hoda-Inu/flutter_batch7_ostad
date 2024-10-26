import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 28),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 460,
                    decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage("assets/images/cardbg.png")),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Color(0x25000000),
                          blurRadius: 45,
                          spreadRadius: 25,
                        ),
                      ]
                  ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 18),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton.filledTonal(
                            onPressed: (){},
                            style: IconButton.styleFrom(
                                backgroundColor: Color(0x401D1D1D)
                            ),
                            icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white,)),
                        IconButton.filledTonal(
                            onPressed: (){},
                            style: IconButton.styleFrom(
                                backgroundColor: const Color(0x401D1D1D)
                            ),
                            icon: const Icon(Icons.bookmark_outline, color: Colors.white,)),
                      ],
                    ),
                  ),
                ),
                  Positioned(
                    bottom: 30,
                    left: 20,
                    right: 20,
                    child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xcf1d1d1d),
                        borderRadius: BorderRadius.circular(15),

                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Andes mountain", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text("Price", style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),),
                            ],
                          ),
                          SizedBox(height: 18,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Row(children: [
                               Icon(Icons.location_on_outlined, color: Color(0xffCAC8C8),),
                               Text("South, America", style: TextStyle(
                                 color: Color(0xffCAC8C8),
                                 fontSize: 18,
                               ),),
                             ],),
                              Text("\$230", style: TextStyle(
                                color: Color(0xffCAC8C8),
                                fontSize: 26,
                                fontWeight: FontWeight.bold
                              ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 40,),
                  const Row(
                    children: [
                      Text("Overview", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Color(0xff1B1B1B)
                      ),),
                      SizedBox(width: 32,),
                      Text("Details", style: TextStyle(
                          color: Color(0x621B1B1B),
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),),
                    ],),
                  const SizedBox(height: 32,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton.filledTonal(
                              onPressed: (){},
                              style: IconButton.styleFrom(
                                  backgroundColor: const Color(0xffEDEDED),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)
                                  )
                              ),
                              icon: const Icon(Icons.watch_later)),
                          const Text("8 hours", style: TextStyle(
                            color: Color(0xff7E7E7E),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),)
                        ],),
                      Row(
                        children: [
                          IconButton.filledTonal(
                              onPressed: (){},
                              style: IconButton.styleFrom(
                                  backgroundColor: const Color(0xffEDEDED),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)
                                  )
                              ),
                              icon: const Icon(Icons.watch_later)),
                          const Text("8 hours", style: TextStyle(
                            color: Color(0xff7E7E7E),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),)
                        ],),
                      Row(
                        children: [
                          IconButton.filledTonal(
                              onPressed: (){},
                              style: IconButton.styleFrom(
                                  backgroundColor: const Color(0xffEDEDED),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)
                                  )
                              ),
                              icon: const Icon(Icons.watch_later)),
                          const Text("8 hours", style: TextStyle(
                            color: Color(0xff7E7E7E),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),)
                        ],),
                    ],
                  ),
                  const SizedBox(height: 34,),
                  const Text("This vast mountain range is renowned for its remarkable diversity in terms of topography and climate. It features towering peaks, active volcanoes, deep canyons, expansive plateaus, and lush valleys. The Andes are This vast mountain range is renowned for its",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 65,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0,),
          child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1B1B1B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Book Now", style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),),
                  SizedBox(width: 20,),
                  Icon(Icons.arrow_forward_ios, color: Colors.white,)
                ],
              )
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
