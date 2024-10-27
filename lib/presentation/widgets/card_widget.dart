import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 270,
          height: 405,
          decoration: BoxDecoration(
              image: const DecorationImage(image: AssetImage("assets/images/card.png")),
              borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton.filledTonal(
                    onPressed: (){},
                    style: IconButton.styleFrom(
                        backgroundColor: const Color(0x401D1D1D)
                    ),
                    icon: const Icon(Icons.favorite_border_rounded, color: Colors.white,)),
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
                          fontSize: 16,
                          fontWeight: FontWeight.bold
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
                        ),),
                      ],),
                      Row(
                        children: [
                          Icon(Icons.star_border_rounded, color: Color(0xffCAC8C8),),
                          SizedBox(width: 5,),
                          Text("4.8", style: TextStyle(
                              color: Color(0xffCAC8C8)
                          ),)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}