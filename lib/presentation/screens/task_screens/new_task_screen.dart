import 'package:flutter/material.dart';

import '../../widgets/task_card.dart';
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
            Expanded(child:
            ListView.separated(
                itemBuilder: (BuildContext context, index)=>TaskCard(textTheme: textTheme),
                separatorBuilder: (BuildContext context, index)=>const SizedBox(height: 12,),
                itemCount: 10
            ),)
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




