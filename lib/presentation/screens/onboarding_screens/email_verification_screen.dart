import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/presentation/screens/onboarding_screens/pin_verification_screen.dart';
import 'package:task_manager/presentation/screens/onboarding_screens/sign_in_screen.dart';
import 'package:task_manager/presentation/utils/snackbar.dart';
import 'package:task_manager/presentation/widgets/center_circular_progress_indicator.dart';
import 'package:task_manager/presentation/widgets/screen_background.dart';

import '../../utils/app_colors.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  TextEditingController _emailTEController = TextEditingController();
  bool inProgress = false;
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
                    ),
                ),
                controller: _emailTEController,
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: Visibility(
                  visible: !inProgress,
                  replacement: const CenterCircularProgressIndicator(),
                  child: ElevatedButton(
                      onPressed: _getRecoverVerifyEmail,
                      child: const Icon(Icons.arrow_circle_right_outlined,
                          color: Colors.white,
                          size: 26)
                  ),
                ),
              ),
              const SizedBox(height: 60,),
            ],);
  }

  void _onTabNextButton(){
    String email = _emailTEController.text.trim();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context)=> PinVerificationScreen(email: email,)),
            (value)=>false);
  }

  Future<void> _getRecoverVerifyEmail()async {
    inProgress = true;
    setState(() {});
    String email = _emailTEController.text.trim();
    NetworkResponse response = await NetworkCaller.getRequest(url: Urls.verifyEmail(email));
    if(response.isSuccess){
      showSnackBarMessage(context, "A pin has been sent");
      _onTabNextButton();
      debugPrint("${response.statusCode}");
    }else{
      showSnackBarMessage(context, response.errorMessage);
    }
    inProgress = false;
    setState(() {});
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
