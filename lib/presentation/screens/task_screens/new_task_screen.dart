import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/presentation/widgets/center_circular_progress_indicator.dart';

import '../../../data/models/task_model.dart';
import '../../../data/utils/urls.dart';
import '../../utils/snackbar.dart';
import '../../widgets/task_card.dart';
import '../../widgets/task_summery_widget.dart';
import 'add_new_task_screen.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  
  bool _getNewTaskListInProgress = false;
  List<TaskModel> _newTaskList = [];
  List<TaskModel> _taskStatusList = [];

  @override
  void initState() {
    super.initState();
    _getNewTaskList();
    _getTaskStatus();
  }
  
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
            Visibility(
              visible: !_getNewTaskListInProgress,
              replacement: const CenterCircularProgressIndicator(),
              child: ListView.separated(
                  itemBuilder: (BuildContext context, index)=>TaskCard(textTheme: textTheme, taskList: _newTaskList[index],),
                  separatorBuilder: (BuildContext context, index)=>const SizedBox(height: 12,),
                  itemCount: _newTaskList.length
              ),
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
  Future<void> _navigateToNewTaskScreen() async {
    final bool? shouldRefresh = await
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNewTaskScreen()));
    if(shouldRefresh==true){
      _getNewTaskList();
    }
  }

  Future<void>_getNewTaskList()async {
    _newTaskList.clear();
    _getNewTaskListInProgress = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.newTaskUrl);
    if(response.isSuccess){
      final TaskListModel taskListModel = TaskListModel.fromJson(response.responseData!);
      _newTaskList = taskListModel.taskList!;
    }else{
      showSnackBarMessage(context, response.errorMessage, true);
    }
    _getNewTaskListInProgress = false;
    setState(() {});
  }

  SingleChildScrollView _buildTaskSummeryMethod(TextTheme textTheme) {
    return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: TaskSummeryWidget(textTheme: textTheme,),
          );
  }

  Future<void>_getTaskStatus()async {


    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.taskStatusUrl);
    if(response.isSuccess){
      final TaskListModel taskListModel = TaskListModel.fromJson(response.responseData!);
      _taskStatusList = taskListModel.taskList!;
    }else{
      showSnackBarMessage(context, response.errorMessage, true);
    }
    _getNewTaskListInProgress = false;
    setState(() {});
  }

}




