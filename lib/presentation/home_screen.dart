import 'package:firebase_practice/auth/auth_service.dart';
import 'package:firebase_practice/presentation/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = AuthService();
  bool isLive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            const Text("Live Score"),
            const SizedBox(width: 5,),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isLive? Colors.red : Colors.grey,
              ),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: (){
            _auth.signOut();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginScreen()), (predicate)=>false);
          },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("TeamOne", style: TextStyle(fontSize: 22),),
                    Text("score", style: TextStyle(fontSize: 18),),
                  ],
                ),
                const SizedBox(width: 14,),
                Text("vs", style: TextStyle(fontSize: 22),),
                const SizedBox(width: 14,),
                Column(
                  children: [
                    Text("TeamTwo", style: TextStyle(fontSize: 22),),
                    Text("score", style: TextStyle(fontSize: 18),)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}