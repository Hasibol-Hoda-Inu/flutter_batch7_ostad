import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _glassNuTEController = TextEditingController();
  List<WaterTrack>waterTrackList=[];

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
            buildWaterCounterHeader(),
            const SizedBox(height: 32,),
            buildWaterTrackerListView()
          ],
        ),
      ),
    );
  }

  Widget buildWaterTrackerListView() {
    return Expanded(child: ListView.separated(
              itemBuilder: (context, index){
                final WaterTrack waterTrack=waterTrackList[index];
                return ListTile(
                  leading: Lottie.asset('assets/animation.json',),
                  title: Text("${waterTrack.noOfGlasses.toString()} Glass of water", style: const TextStyle(
                    fontSize: 18
                  ),),
                    subtitle: Text(
                      DateFormat('hh:mm a, dd MMM yyyy').format(waterTrack.dateTime),
                    ),
                  trailing: IconButton.filledTonal(
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (context) =>
                               AlertDialog(
                                  title: const Text('Do you want to delete?'),
                                 actions: [
                                   TextButton(
                                       onPressed: (){
                                         _onTabDeleteMethod(index);
                                         Navigator.of(context).pop();
                                         ScaffoldMessenger.of(context).showSnackBar(
                                             const SnackBar(
                                               content: Text('The item has been successfully deleted.'),
                                               backgroundColor: Colors.blueAccent,
                                               behavior: SnackBarBehavior.floating,
                                               margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                             )
                                         );
                                         setState(() {});
                                       },
                                       child: const Text('Yes', style: TextStyle(
                                         color: Colors.red,
                                         fontSize: 16,
                                       ),)
                                   ),
                                   TextButton(
                                       onPressed: (){
                                         Navigator.of(context).pop();
                                       },
                                       child: const Text('No', style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 16
                                       ),)
                                   ),
                                 ],
                                 actionsPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                ),
                            );
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: const Color(0xffE3EBF9)
                      ),
                      icon: const Icon(Icons.delete_outline_rounded))
                );
              },
              separatorBuilder: (context, index){
                return const Divider();
              },
              itemCount: waterTrackList.length,
          )
          );
  }

  Widget buildWaterCounterHeader() {
    return Column(
            children: [
              Text(getTotalGlassCount().toString(), style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent
              ),),
              const Text('Glass of water',style: TextStyle(
                fontSize: 16
              ),),
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 140,
                    child: TextField(
                      controller: _glassNuTEController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(Radius.circular(40))
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.all(Radius.circular(40))
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
                      onPressed: (){
                        _addNewWaterTrack();
                        _glassNuTEController.clear();
                      },
                      icon: const Icon(Icons.add), iconSize: 36,)
                ],
              ),
            ],
          );
  }

  int getTotalGlassCount(){
    int counter =0;
    for(WaterTrack t in waterTrackList){
      counter += t.noOfGlasses;
    }
    return counter;
  }

  void _addNewWaterTrack(){
    if(_glassNuTEController.text.isEmpty){
      _glassNuTEController.text='1';
    }
    final int noOfGlasses= int.tryParse(_glassNuTEController.text)??1;
    WaterTrack waterTrack=WaterTrack(noOfGlasses: noOfGlasses, dateTime: DateTime.now());
    waterTrackList.add(waterTrack);
    setState(() {

    });
  }

  void _onTabDeleteMethod(int index){
    waterTrackList.removeAt(index);
    setState(() {

    });
  }

  @override
  void dispose() {
    _glassNuTEController.dispose();
    super.dispose();
  }
}

class WaterTrack{
  final int noOfGlasses;
  final DateTime dateTime;

  WaterTrack({required this.noOfGlasses, required this.dateTime});
}
