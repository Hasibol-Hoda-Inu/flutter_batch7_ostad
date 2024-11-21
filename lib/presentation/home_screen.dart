import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../auth/auth_service.dart';
import 'cricket_match.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = AuthService();
  bool isLive = false;

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  List<CricketMatch>_cricketMatchList = [];

  Future<void>_getScoreData()async {
    _cricketMatchList.clear();
    setState(() {});
    final QuerySnapshot snapshot = await _firebaseFirestore.collection("Cricket").get();
      for(DocumentSnapshot doc in snapshot.docs){
        _cricketMatchList.add(CricketMatch.fromJson(doc.data() as Map<String, dynamic>));
      }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getScoreData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            const Text("Live Score"),
            const SizedBox(width: 5,),
            Badge(backgroundColor: _cricketMatchList[0].isMatchRunning?Colors.red:Colors.grey,)
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _cricketMatchList.length,
                itemBuilder: (BuildContext context, index){
                  CricketMatch cricketMatch = _cricketMatchList[0];
                  return ListTile(
                    leading: Badge(backgroundColor: cricketMatch.isMatchRunning? Colors.red:Colors.grey,),
                    title: Text("${cricketMatch.TeamOne} vs ${cricketMatch.TeamTwo}"),
                    subtitle: Text("${cricketMatch.TeamOneScore} vs ${cricketMatch.TeamTwoScore}"),
                  );
                }),
          ),
          Text(_cricketMatchList[0].TeamTwo),
        ],
      ),
    );
  }
}