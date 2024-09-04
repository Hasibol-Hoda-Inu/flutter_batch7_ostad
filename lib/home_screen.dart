import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int _counter = 0;
  int _total=0;
  List <int> price=[51, 30, 43];
  void _incrementCounter() {
    setState(() {
      _counter++;
      _totalPriceCounter();
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
      _totalPriceCounter();
    });
  }

  void _totalPriceCounter(){
    _total= _counter*price[0];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        title: const Text('My Bag', style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: 140,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Image.asset('assets/images/shirt.jpg', width:140,),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                   Text('Pullover', style: TextStyle(
                                     fontSize: 20,
                                     fontWeight: FontWeight.w600,
                                   ),),
                                   Row(
                                     children: [
                                       Text('Color: ', style: TextStyle(
                                         fontSize: 16,
                                       ),),
                                       Text('Black', style: TextStyle(
                                         fontSize: 16,
                                       ),),
                                       SizedBox(width: 16,),
                                       Text('Size: ', style: TextStyle(
                                         fontSize: 16,
                                       ),),
                                       Text('L', style: TextStyle(
                                         fontSize: 16,
                                       ),),
                                     ],
                                   ),
                                 ],),
                                Row(
                                  children: [
                                    Material(
                                      elevation: 2.0,
                                      shape: const CircleBorder(),
                                      color: Colors.white,
                                      child: IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {
                                          _decrementCounter();
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 16,),
                                    Text("$_counter", style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600
                                    ),),
                                    const SizedBox(width: 16,),
                                    Material(
                                      elevation: 2.0,
                                      shape: const CircleBorder(),
                                      color: Colors.white,
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          _incrementCounter();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(Icons.more_vert_rounded, color: Colors.grey,),
                            Text("${price[0]}\$", style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),)
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total amount',style: TextStyle(
                    fontSize: 18,
                  ),),
                  Text('$_total\$', style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
              const SizedBox(height: 16,),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffDB3022)
                  ),
                  child: Text('CHECK OUT'.toUpperCase(), style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                  ),
                ),
              )
            ],)
          ],
        ),
      ),
    );
  }
}