import 'package:flutter/material.dart';
import 'package:task_manager/presentation/widgets/center_circular_progress_indicator.dart';

import '../../../data/models/network_response.dart';
import '../../../data/models/task_list_model.dart';
import '../../../data/models/task_model.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utils/urls.dart';
import '../../utils/snackbar.dart';
import '../../widgets/task_card.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  List<TaskModel> _completedTaskList = [];
  bool _completedTaskInProgress = false;
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
      child: Visibility(
        visible: !_completedTaskInProgress,
        replacement: const CenterCircularProgressIndicator(),
        child: ListView.separated(
            itemBuilder: (BuildContext context, index)=>TaskCard(textTheme: textTheme, taskList: _completedTaskList[index],),
            separatorBuilder: (BuildContext context, index)=>const SizedBox(height: 12,),
            itemCount: _completedTaskList.length
        ),
      ),
    ),
    );
  }
  Future<void>_getNewTaskList()async {
    _completedTaskList.clear();
    _completedTaskInProgress = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.completedTaskUrl);
    if(response.isSuccess){
      final TaskListModel taskListModel = TaskListModel.fromJson(response.responseData!);
      _completedTaskList = taskListModel.taskList!;
    }else{
      showSnackBarMessage(context, response.errorMessage, true);
    }
    _completedTaskInProgress = false;
    setState(() {});
  }

}
