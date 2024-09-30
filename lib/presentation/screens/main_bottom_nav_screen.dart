import 'package:flutter/material.dart';
import 'package:task_manager/presentation/screens/task_screens/cancelled_task_screen.dart';
import 'package:task_manager/presentation/screens/task_screens/completed_task_screen.dart';
import 'package:task_manager/presentation/screens/task_screens/progress_task_screen.dart';
import 'package:task_manager/presentation/utils/app_colors.dart';

import 'task_screens/new_task_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    NewTaskScreen(),
    CompletedTaskScreen(),
    CancelledTaskScreen(),
    ProgressTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        indicatorColor: AppColors.primaryColor,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index){
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.file_copy_rounded), label: "New Task",),
          NavigationDestination(icon: Icon(Icons.file_copy_rounded), label: "Completed"),
          NavigationDestination(icon: Icon(Icons.file_copy_rounded), label: "Cancelled"),
          NavigationDestination(icon: Icon(Icons.file_copy_rounded), label: "Progress"),
        ],
        
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TMAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TMAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          Text('hasinulhuda@gmail.com', style: TextStyle(
            color: Colors.white,
            fontSize: 14
          ),),
        ],)),
        IconButton(
            onPressed: _logOutMethod,
            icon: const Icon(Icons.logout_rounded, color: Colors.white,))
      ],),
      backgroundColor: AppColors.primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _logOutMethod(){
    ///TODO: Implement Log Out Method
  }
}
