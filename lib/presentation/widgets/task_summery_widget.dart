import 'package:flutter/material.dart';


class TaskSummeryWidget extends StatelessWidget {
  const TaskSummeryWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TaskSummeryContainer(textTheme: textTheme, title: 'Canceled', count: 90,),
        const SizedBox(width: 8,),
        TaskSummeryContainer(textTheme: textTheme, title: 'Completed', count: 90,),
        const SizedBox(width: 8,),
        TaskSummeryContainer(textTheme: textTheme, title: 'Progress', count: 90,),
        const SizedBox(width: 8,),
        TaskSummeryContainer(textTheme: textTheme, title: 'New Task', count: 90,),
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