import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/presentation/screens/onboarding_screens/email_verification_screen.dart';
import 'package:task_manager/presentation/screens/onboarding_screens/sign_in_screen.dart';
import 'package:task_manager/presentation/widgets/screen_background.dart';

import '../../utils/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80,),
                Text('Join with us',
                  style: textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold),),
                _signUpFormMethod(),
                _signInSection()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signUpFormMethod() {
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
                      hintText: "First name",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Last name",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Mobile",
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
                _buildOnTapNextButton()
              ],);
  }

  Column _buildOnTapNextButton() {
    return Column(children: [
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: _onTapNavigateToEmailVerificationScreen,
                      child: const Icon(Icons.arrow_circle_right_outlined,
                          color: Colors.white,
                          size: 26)
                  ),
                ),
                const SizedBox(height: 60,),
              ],);
  }

  void _onTapNavigateToEmailVerificationScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
  }

  Center _signInSection() {
    return Center(
      child: RichText(text: TextSpan(
          text: "Have an account? ", style: const TextStyle(
          color: Color(0xff2E374F),
          fontSize: 16
      ),
          children: [
            TextSpan(
                text: "Sign in",
                style: const TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
              recognizer: TapGestureRecognizer()..onTap = _onTapNavigateToSignInScreen
            )
          ]
      )),
    );
  }
  void _onTapNavigateToSignInScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
  }
}
