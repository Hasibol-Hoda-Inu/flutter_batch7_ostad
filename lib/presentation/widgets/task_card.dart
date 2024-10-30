import 'package:flutter/material.dart';

import '../../data/models/network_response.dart';
import '../../data/models/task_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';
import '../utils/snackbar.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.textTheme,
    required this.taskList,
    required this.onRefreshList,
  });

  final TextTheme textTheme;
  final TaskModel taskList;
  final VoidCallback onRefreshList;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  String _selectedStatus = '';
  bool _changeStatusInProgress = false;
  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.taskList.status!;
  }
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
          onTap: (){
            _changeStatus(e);
            Navigator.pop(context);
          },
          selected: _selectedStatus ==e,
          trailing: _selectedStatus == e ? const Icon(Icons.check): null,
        )).toList(),
      ),
      actions: [
        TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
      ],
    ));
  }

  Future<void> _changeStatus(String newStatus)async {
    _changeStatusInProgress = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.changeStatus(widget.taskList.sId!, newStatus));
    if(response.isSuccess){
      widget.onRefreshList();
    }else{
      _changeStatusInProgress = false;
      setState(() {});
      showSnackBarMessage(context, response.errorMessage);
    }
  }

  void _onTapDeleteButton(){
    showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
      title: const Text("Do you want to delete?"),
      actions: [
        TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Text("No")),
        TextButton(
            onPressed: (){
              _deleteTask();
              Navigator.pop(context);
            },
            child: const Text("Yes")),
      ],
    ));
  }

  Future<void>_deleteTask()async {
    String id = widget.taskList.sId ?? "";
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.deleteUrl+id);
    if(response.isSuccess){
      widget.onRefreshList();
      showSnackBarMessage(context, "Successfully deleted", false);
    }else{
      showSnackBarMessage(context, response.errorMessage, true);
    }
    setState(() {});
  }

  Widget _buildTaskStatusChip() => Chip(label: Text(widget.taskList.status ?? ""),);
}