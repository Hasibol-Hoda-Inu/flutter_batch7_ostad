import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/presentation/screens/onboarding_screens/sign_in_screen.dart';
import 'package:task_manager/presentation/widgets/screen_background.dart';

import '../../utils/app_colors.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ScreenBackground(
        child:
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your email address",
                style: textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold),),
              Text('A 6 digit verification pi will send to your email address',
                  style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
              ),
              _emailVerificationForm(),
              _signInSectionMethod()
          ],
        ),
      ),),
    );
  }


  Column _emailVerificationForm() {
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: _onTabNextButton,
                    child: const Icon(Icons.arrow_circle_right_outlined,
                        color: Colors.white,
                        size: 26)
                ),
              ),
              const SizedBox(height: 60,),
            ],);
  }
  void _onTabNextButton(){
    //TODO: implement on tab action
  }

  Widget _signInSectionMethod() {
    return Center(
      child: RichText(text:  TextSpan(
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
                recognizer: TapGestureRecognizer()..onTap = _onTapNextScreen
            )
          ]
      )),
    );
  }
  void _onTapNextScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
  }
}
