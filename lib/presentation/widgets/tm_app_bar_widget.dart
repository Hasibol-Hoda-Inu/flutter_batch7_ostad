import 'package:flutter/material.dart';
import 'package:task_manager/presentation/screens/onboarding_screens/sign_in_screen.dart';

import '../utils/app_colors.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TMAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(children: [
        const CircleAvatar(
          foregroundColor: Colors.white,
          radius: 18,
        ),
        const SizedBox(width: 8,),
        const Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hasinul Huda Enu', style:
            TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),),
            Text('hasinulhuda@gmail.com', style: TextStyle(
                color: Colors.white,
                fontSize: 14
            ),),
          ],)),
        IconButton(
            onPressed: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginScreen()), (predicate)=>false);
            },
            icon: const Icon(Icons.logout_rounded, color: Colors.white,))
      ],),
      backgroundColor: AppColors.primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}