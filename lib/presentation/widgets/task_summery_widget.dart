import 'package:flutter/material.dart';

class TaskSummeryWidget extends StatefulWidget {
  const TaskSummeryWidget({
    super.key,
    required this.title,
    required this.count,
  });
  final String title;
  final int count;

  @override
  State<TaskSummeryWidget> createState() => _TaskSummeryWidgetState();
}

class _TaskSummeryWidgetState extends State<TaskSummeryWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TaskSummeryContainer(title: "New", count: widget.count,),
        const SizedBox(width: 8,),
        TaskSummeryContainer(title: "Completed", count: widget.count ?? 0,),
        const SizedBox(width: 8,),
        TaskSummeryContainer(title: "Cancelled", count: widget.count ?? 0,),
        const SizedBox(width: 8,),
        TaskSummeryContainer(title: "Progress", count: widget.count ?? 0,),
      ],
    );
  }
}

class TaskSummeryContainer extends StatelessWidget {
  const TaskSummeryContainer({
    super.key,
    required this.title,
    required this.count,
  });
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
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