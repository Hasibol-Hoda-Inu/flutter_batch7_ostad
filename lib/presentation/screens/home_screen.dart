import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water tracker app', style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('12', style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent
            ),),
            const Text('Glasses of water',style: TextStyle(
              fontSize: 16
            ),),
            const SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 120,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),

                        borderRadius: BorderRadius.all(Radius.circular(20))
                      )
                    ),
                  ),
                ),
                const SizedBox(width: 8,),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,

                  ),
                    onPressed: (){},
                    icon: const Icon(Icons.add), iconSize: 34,)
              ],
            ),
            const SizedBox(height: 32,),
            Expanded(child: ListView.separated(
                itemBuilder: (context, index){
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xffE3EBF9),
                      child: Lottie.asset('assets/animation.json',),
                    ),
                    title: Text('2 glass of water', style: TextStyle(
                      fontSize: 18
                    ),),
                    subtitle: Text('Date & time'),
                    trailing: IconButton.filledTonal(
                        onPressed: (){},
                        style: IconButton.styleFrom(
                          backgroundColor: const Color(0xffE3EBF9)
                        ),
                        icon: const Icon(Icons.delete_outline_rounded))
                  );
                },
                separatorBuilder: (context, index){
                  return const Divider();
                },
                itemCount: 3
            )
            )
          ],
        ),
      ),
    );
  }
}
