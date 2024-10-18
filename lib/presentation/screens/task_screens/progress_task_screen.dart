import 'package:flutter/material.dart';

import '../../../data/models/network_response.dart';
import '../../../data/models/task_list_model.dart';
import '../../../data/models/task_model.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utils/urls.dart';
import '../../utils/snackbar.dart';
import '../../widgets/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  List<TaskModel> _progressTaskList =[];
  bool _progressTaskInProgress = false;
  @override
  void initState() {
    super.initState();
    _getNewTaskList();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return  Expanded(child:
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16.0),
      child: ListView.separated(
          itemBuilder: (BuildContext context, index)=>TaskCard(textTheme: textTheme, taskList: _progressTaskList[index],),
          separatorBuilder: (BuildContext context, index)=>const SizedBox(height: 12,),
          itemCount: _progressTaskList.length
      ),
    ),
    );
  }
  Future<void>_getNewTaskList()async {
    _progressTaskList.clear();
    _progressTaskInProgress = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.progressTaskUrl);
    if(response.isSuccess){
      final TaskListModel taskListModel = TaskListModel.fromJson(response.responseData!);
      _progressTaskList = taskListModel.taskList!;
    }else{
      showSnackBarMessage(context, response.errorMessage, true);
    }
    _progressTaskInProgress = false;
    setState(() {});
  }
}
