import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/presentation/widgets/screen_background.dart';

import '../../utils/app_colors.dart';
import 'sign_in_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Set password",
                        style: textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold),),
                      Text('Password must be at least 8 characters long, containing both letters and numbers.',
                        style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
                      ),
                      _resetPasswordFormMethod(),
                      _signInSection(),
                    ],
                  ),
          )),
    );
  }

  Widget _resetPasswordFormMethod() {
    return Column(children: [
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
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Confirm password",
                            hintStyle: TextStyle(
                                color: Colors.grey
                            )
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: _verifyEmailMethod,
                            child: const Icon(Icons.arrow_circle_right_outlined,
                                color: Colors.white,
                                size: 26)
                        ),
                      ),
                      const SizedBox(height: 60,),
                    ],);
  }
  void _verifyEmailMethod(){}

  Widget _signInSection() {
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
