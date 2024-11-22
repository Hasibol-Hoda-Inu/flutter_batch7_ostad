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

  final List<CricketMatch>_cricketMatchList = [];

  void _extractData(QuerySnapshot<Map<String, dynamic>>?snapshot){
    _cricketMatchList.clear();
    for(DocumentSnapshot doc in snapshot?.docs??[]){
      _cricketMatchList.add(CricketMatch.fromJson(doc.data() as Map<String, dynamic>));
    }
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
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("Cricket").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);
                }
                if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()),);
                }
                if(snapshot.hasData) {
                  _extractData(snapshot.data);
                  return ListView.builder(
                      itemCount: _cricketMatchList.length,
                      itemBuilder: (BuildContext context, index) {
                        CricketMatch cricketMatch = _cricketMatchList[index];
                        return ListTile(
                          leading: Badge(backgroundColor: cricketMatch
                              .isMatchRunning ? Colors.red : Colors.grey,),
                          title: Text("${cricketMatch.TeamOne} vs ${cricketMatch
                              .TeamTwo}"),
                          subtitle: Text("${cricketMatch
                              .TeamOneScore} vs ${cricketMatch.TeamTwoScore}"),
                        );
                      });
                }
                return const SizedBox();
              }
            ),
          ),
          // Text(_cricketMatchList[0].TeamTwo),
        ],
      ),
    );
  }
}