import 'package:flutter/material.dart';

import 'utility/app_color.dart';
import 'widgets/user_input_widget.dart';

class UserInputScreen extends StatelessWidget {
  const UserInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(children: [Text('BMI ', style: TextStyle(fontWeight: FontWeight.bold),), Text('Calculator')],),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          )
        ],
      ),
      body: const SingleChildScrollView(child:
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: UserInputWidget(),
      ),),
    );
  }
}


