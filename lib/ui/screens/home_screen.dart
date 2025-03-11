import 'package:flutter/material.dart';
import 'package:sql_practice/database/task_data_model.dart';

import '../../database/database_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _taskController = TextEditingController();
  List<TaskDataModel> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task App'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                        hintText: 'Enter task'
                    ),
                  ),
                ),
                IconButton.filled(
                    onPressed: () {
                      _addTask();
                    },
                    icon: Icon(Icons.add)
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) =>
                    ListTile(
                      leading: CircleAvatar(child: Text('${index + 1}')),
                      title: Text(_tasks[index].title),
                      trailing: Wrap(
                        children: [
                          IconButton(
                              onPressed: () {
                                _toggleTask(
                                  _tasks[index].id!,
                                  _tasks[index].isCompleted == 0 ? 1 : 0
                                );
                              },
                              icon: _tasks.toList()[index].isCompleted == 0
                                  ? Icon(Icons.check_box_outline_blank)
                                  : Icon(Icons.check_box)
                          ),
                          IconButton(
                              onPressed: () {
                                 _deleteTask(_tasks[index].id!);
                              },
                              icon: Icon(Icons.delete)
                          ),
                        ],
                      ),
                    )
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _loadTasks() async {
    final tasks = await DatabaseHelper.instance.getTasks();
    setState(() {
      _tasks = tasks.map((task) => TaskDataModel.fromMap(task)).toList();
    });
  }

  Future<void> _addTask() async {
    final taskTitle = _taskController.text;
    if (taskTitle.isNotEmpty) {
      final task = TaskDataModel(title: taskTitle);
      await DatabaseHelper.instance.insertTask(task.toMap());
      _taskController.clear();
      _loadTasks();
    }
  }

  Future<void> _toggleTask(int id, int isCompleted) async {
    await DatabaseHelper.instance.updateTask(id, isCompleted);
    _loadTasks();
  }

  Future<void> _deleteTask(int id) async {
    await DatabaseHelper.instance.deleteTask(id);
    _loadTasks();
  }

}