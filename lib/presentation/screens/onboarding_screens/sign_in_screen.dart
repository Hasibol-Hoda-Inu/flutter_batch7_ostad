import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/presentation/screens/main_bottom_nav_screen.dart';
import 'package:task_manager/presentation/screens/onboarding_screens/reset_password_screen.dart';
import 'package:task_manager/presentation/utils/app_colors.dart';
import 'package:task_manager/presentation/widgets/screen_background.dart';

import 'email_verification_screen.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: const Color(0xffFAF8F6),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Get Started with',
                style: textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold),),
              _signInFormMethod(),
              _buildSignUpSection()
            ],
          ),
        ),),
    );
  }

  Widget _signInFormMethod() {
    return Column(children: [
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: _onTabNextButton,
                      child: const Icon(Icons.arrow_circle_right_outlined,
                          color: Colors.white,
                          size: 26)
                  ),
                ),
              ],);
  }
  void _onTabNextButton(){
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context)=>const MainBottomNavScreen()),
            (Route<dynamic> route)=>false);
  }

  Widget _buildSignUpSection() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 40,),
          TextButton(
              onPressed: _onTabForgetPassword,
              child: const Text("Forget password?", style: TextStyle(
                  color: Color(0xff5F5F5F),
                  fontSize: 16
              ),)),
          RichText(text: TextSpan(
              text: "Don't have an account? ", style: const TextStyle(
              color: Color(0xff2E374F),
              fontSize: 16
          ),
              children: [
                TextSpan(
                    text: "Sign up",
                    style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
                  recognizer: TapGestureRecognizer()..onTap = _onTabSignUpScreen
                )
              ]
          ))
        ],),
    );
  }
  void _onTabForgetPassword(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResetPasswordScreen()));
  }
  void _onTabSignUpScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
  }
}
