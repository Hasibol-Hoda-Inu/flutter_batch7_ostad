import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task_list_model.dart';

import '../../../data/models/network_response.dart';
import '../../../data/models/task_model.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utils/urls.dart';
import '../../utils/snackbar.dart';
import '../../widgets/task_card.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  List <TaskModel> _cancelledTaskList = [];
  bool _getCancelledTaskListInProgress = false;
  @override
  void initState() {
    super.initState();
    _getCancelledTaskList();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return  Expanded(child:
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16.0),
      child: ListView.separated(
          itemBuilder: (BuildContext context, index)=>TaskCard(textTheme: textTheme, taskList: _cancelledTaskList[index],),
          separatorBuilder: (BuildContext context, index)=>const SizedBox(height: 12,),
          itemCount: _cancelledTaskList.length
      ),
    ),
    );
  }
  Future<void>_getCancelledTaskList()async {
    _cancelledTaskList.clear();
    _getCancelledTaskListInProgress = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.cancelledTaskUrl);
    if(response.isSuccess){
      final TaskListModel taskListModel = TaskListModel.fromJson(response.responseData!);
      _cancelledTaskList = taskListModel.taskList!;
    }else{
      showSnackBarMessage(context, response.errorMessage, true);
    }
    _getCancelledTaskListInProgress = false;
    setState(() {});
  }
}
