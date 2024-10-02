import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Lorem impsum dollar sit amit",
              style: widget.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),),
            const SizedBox(height: 8,),
            Text("Lorem ipsum dolor sit amet, conse ctetur adipis cing elit, sed do eiusmod tempor",
              style: widget.textTheme.bodyLarge,),
            const SizedBox(height: 8,),
            const Text("Date: 02/02/2024"),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTaskStatusChip(),
                OverflowBar(children: [
                  IconButton(
                      onPressed: _onTapEditButton,
                      icon: const Icon(Icons.edit_note_outlined),
                  ),
                  IconButton(
                    onPressed: _onTapDeleteButton,
                      icon: const Icon(Icons.delete_rounded),
                  ),
                ],)
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onTapEditButton(){
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: const Text("Edit Status"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: ["New", "Completed", "Canceled", "Progress"].map((e)=>ListTile(
          title: Text(e),
          onTap: (){},
        )).toList(),
      ),
      actions: [
        TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        TextButton(
            onPressed: (){},
            child: const Text("Okay")),
      ],
    ));
  }

  void _onTapDeleteButton(){}

  Widget _buildTaskStatusChip() => const Chip(label: Text('New'),);
}