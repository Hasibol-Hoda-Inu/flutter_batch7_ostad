import 'package:flutter/material.dart';

import '../../data/models/task_model.dart';


class TaskSummeryWidget extends StatefulWidget {
  const TaskSummeryWidget({
    super.key,
    required this.textTheme,
  });
  final TextTheme textTheme;

  @override
  State<TaskSummeryWidget> createState() => _TaskSummeryWidgetState();
}

class _TaskSummeryWidgetState extends State<TaskSummeryWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TaskSummeryContainer(textTheme: widget.textTheme, title: 'Canceled', count: 90,),
        const SizedBox(width: 8,),
        TaskSummeryContainer(textTheme: widget.textTheme, title: 'Completed', count: 90,),
        const SizedBox(width: 8,),
        TaskSummeryContainer(textTheme: widget.textTheme, title: 'Progress', count: 90,),
        const SizedBox(width: 8,),
        TaskSummeryContainer(textTheme: widget.textTheme, title: 'New Task', count: 90,),
      ],
    );
  }
}

class TaskSummeryContainer extends StatelessWidget {
  const TaskSummeryContainer({
    super.key,
    required this.textTheme,
    required this.title,
    required this.count,
  });

  final TextTheme textTheme;
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(count.toString(), style: textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),),
            Text(title, style: textTheme.bodyLarge,),
          ],
        ),
      ),
    );
  }
}