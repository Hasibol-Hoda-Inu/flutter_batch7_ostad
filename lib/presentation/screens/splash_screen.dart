import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/presentation/screens/onboarding_screens/sign_in_screen.dart';

import '../widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void>_navigateToNextScreen()async {
   await Future.delayed(const Duration(seconds: 2));
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
        child: SvgPicture.asset("assets/images/logo.svg", alignment: Alignment.center,),
      ),),
    );
  }
}


