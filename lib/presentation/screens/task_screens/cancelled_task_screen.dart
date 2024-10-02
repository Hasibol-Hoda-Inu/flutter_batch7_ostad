import 'package:flutter/material.dart';

import '../../widgets/task_card.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return  Expanded(child:
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16.0),
      child: ListView.separated(
          itemBuilder: (BuildContext context, index)=>TaskCard(textTheme: textTheme),
          separatorBuilder: (BuildContext context, index)=>const SizedBox(height: 12,),
          itemCount: 10
      ),
    ),
    );
  }
}
