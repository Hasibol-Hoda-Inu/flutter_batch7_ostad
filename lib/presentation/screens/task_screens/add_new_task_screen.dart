import 'package:flutter/material.dart';
import 'package:task_manager/presentation/widgets/tm_app_bar_widget.dart';

import '../../widgets/screen_background.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(),
      body: ScreenBackground(
        child:
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 56,),
                Text("Add new task",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold),),
                const SizedBox(height: 32,),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Subject",
                  ),
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: "Description",
                  ),
                ),
                const SizedBox(height: 32,),
                ElevatedButton(
                    onPressed: (){},
                    child: const Icon(Icons.arrow_circle_right_outlined, color: Colors.white,))
              ],
            ),
          ),
        ),),
    );
  }
}
