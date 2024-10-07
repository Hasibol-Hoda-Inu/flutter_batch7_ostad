import 'package:flutter/material.dart';
import 'package:task_manager/presentation/screens/task_screens/cancelled_task_screen.dart';
import 'package:task_manager/presentation/screens/task_screens/completed_task_screen.dart';
import 'package:task_manager/presentation/screens/task_screens/progress_task_screen.dart';
import 'package:task_manager/presentation/utils/app_colors.dart';

import '../widgets/tm_app_bar_widget.dart';
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
      appBar: const TMAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        indicatorColor: AppColors.primaryColor.withOpacity(0.7),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index){
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.file_copy_rounded), label: "New Task",),
          NavigationDestination(icon: Icon(Icons.file_copy_rounded), label: "Completed"),
          NavigationDestination(icon: Icon(Icons.file_copy_rounded), label: "Cancelled"),
          NavigationDestination(icon: Icon(Icons.file_copy_rounded), label: "Progress"),
        ],
      ),
    );
  }
}


