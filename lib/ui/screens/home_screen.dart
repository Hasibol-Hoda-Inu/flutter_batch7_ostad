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
                    onPressed: (){},
                    icon: Icon(Icons.add)
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index)=> ListTile(
                  leading: Text('$index'),
                  title: Text('Task $index'),
                  trailing: Wrap(
                    children: [
                      IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.check_box_outline_blank)
                      ),
                      IconButton(
                          onPressed: (){},
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
}
