import 'package:flutter/material.dart';

import '../../widgets/task_summery_widget.dart';
import 'add_new_task_screen.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16.0),
        child: Column(
          children: [
            _buildTaskSummeryMethod(textTheme),
            const SizedBox(height: 24,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Lorem impsum dollar sit amit",
                      style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),),
                    const SizedBox(height: 8,),
                    Text("Lorem ipsum dolor sit amet, conse ctetur adipis cing elit, sed do eiusmod tempor",
                      style: textTheme.bodyLarge,),
                    const SizedBox(height: 8,),
                    Text("Date: 02/02/2024"),
                    const SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                fixedSize: const Size.fromWidth(120),
                                padding: const EdgeInsets.symmetric(vertical: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)
                                )
                              ),
                              child: const Text('New', style: TextStyle(
                                  color: Colors.white
                              ),
                              ))],
                      ),
                      Row(children: [
                        IconButton(onPressed: (){}, icon: const Icon(Icons.edit_note_outlined)),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.delete_rounded)),
                      ],),
                    ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToNewTaskScreen,
        child: const Icon(Icons.add),
      ),
    );
  }
  void _navigateToNewTaskScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNewTaskScreen()));
  }

  SingleChildScrollView _buildTaskSummeryMethod(TextTheme textTheme) {
    return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: TaskSummeryWidget(textTheme: textTheme),
          );
  }

}


