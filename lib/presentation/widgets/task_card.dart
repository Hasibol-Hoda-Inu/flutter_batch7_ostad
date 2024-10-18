import 'package:flutter/material.dart';

import '../../data/models/network_response.dart';
import '../../data/models/task_list_model.dart';
import '../../data/models/task_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';
import '../utils/snackbar.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.textTheme,
    required this.taskList,
  });

  final TextTheme textTheme;
  final TaskModel taskList;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            Text(widget.taskList.title ?? "",
              style: widget.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),),
            const SizedBox(height: 8,),
            Text(widget.taskList.description ?? "",
              style: widget.textTheme.bodyLarge,),
            const SizedBox(height: 8,),
            Text("Date: ${widget.taskList.createdDate}"),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTaskStatusChip(),
                OverflowBar(children: [
                  IconButton(
                      onPressed: _onTapEditButton,
                      icon: const Icon(Icons.edit_note_outlined),
                  ),
                  IconButton(
                    onPressed: _onTapDeleteButton,
                      icon: const Icon(Icons.delete_rounded),
                  ),
                ],)
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onTapEditButton(){
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: const Text("Edit Status"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: ["New", "Completed", "Canceled", "Progress"].map((e)=>ListTile(
          title: Text(e),
          onTap: (){},
        )).toList(),
      ),
      actions: [
        TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        TextButton(
            onPressed: (){},
            child: const Text("Okay")),
      ],
    ));
  }

  void _onTapDeleteButton(){}

  // Future<void>_deleteTask()async {
  //   TaskModel taskModel = TaskModel[index]._id;
  //   String _id = taskModel
  //   final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.deleteTaskUrl);
  //   if(response.isSuccess){
  //     final TaskListModel taskListModel = TaskListModel.fromJson(response.responseData!);
  //
  //   }else{
  //     showSnackBarMessage(context, response.errorMessage, true);
  //   }
  //   setState(() {});
  // }

  Widget _buildTaskStatusChip() => const Chip(label: Text('New'),);
}