import 'package:flutter/material.dart';

import '../widgets/screen_background.dart';
import '../widgets/tm_app_bar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(isOnProfileScreen: true),
      body: ScreenBackground(
        child:
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 56,),
                Text("Update Profile",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold),),
                const SizedBox(height: 32,),
                _buildPhotoPicker(),
                const SizedBox(height: 12,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                ),
                const SizedBox(height: 12,),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "First Name",
                  ),
                ),
                const SizedBox(height: 12,),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Last Name",
                  ),
                ),
                const SizedBox(height: 12,),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: "Mobile",
                  ),
                ),
                const SizedBox(height: 12,),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                ),
                const SizedBox(height: 32,),
                ElevatedButton(
                    onPressed: (){},
                    child: const Icon(Icons.arrow_circle_right_outlined, color: Colors.white,))
              ],
            ),
          ),
        ),),
    );();
  }

  Container _buildPhotoPicker() {
    return Container(
                height: kToolbarHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white
                ),
                child: Row(children: [
                  Container(
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xff666666),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomLeft: Radius.circular(6)
                      )
                    ),
                    child: const Center(child: Text("Photos", style: TextStyle(
                      color: Color(0xffE8E8E8)
                    ),),),
                  )],),
              );
  }
}
