import 'package:flutter/material.dart';
import 'package:task_manager/presentation/utils/app_colors.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          const CircleAvatar(
            foregroundColor: Colors.white,
            radius: 18,
          ),
          const SizedBox(width: 8,),
          const Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Hasinul Huda Enu', style:
            TextStyle(
                color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),),
            Text('data', style: TextStyle(
              color: Colors.white,
              fontSize: 14
            ),),
          ],)),
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.logout_rounded, color: Colors.white,))
        ],),
        backgroundColor: AppColors.primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
        child: const Icon(Icons.add),
      ),
    );
  }
}
