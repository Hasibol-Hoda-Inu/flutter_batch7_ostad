import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/presentation/utils/snackbar.dart';
import 'package:task_manager/presentation/widgets/center_circular_progress_indicator.dart';
import 'package:task_manager/presentation/widgets/screen_background.dart';

import '../../../data/utils/urls.dart';
import '../../utils/app_colors.dart';
import 'sign_in_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.OTP
  });

  final String email;
  final String OTP;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool inProgress = false;
  TextEditingController _passwordTEController = TextEditingController();
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
    return Column(
      children: [
        const SizedBox(height: 20,),
        TextFormField(
          decoration: const InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                                color: Colors.grey
                            )
                        ),
          controller: _passwordTEController,
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
          child: Visibility(
            visible: !inProgress,
            replacement: const CenterCircularProgressIndicator(),
            child: ElevatedButton(
                onPressed: _getRecoverResetPassword,
                child: const Icon(Icons.arrow_circle_right_outlined,
                    color: Colors.white,
                    size: 26)
            ),
          ),
        ),
        const SizedBox(height: 60,),
      ],
    );
  }


  Future<void> _getRecoverResetPassword()async {
    inProgress = true;
    setState(() {});

    Map<String, dynamic> reqBody = {
      "email": widget.email,
      "OTP": widget.OTP,
      "password": _passwordTEController.text,
    };

    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.resetPassword,
        body: reqBody,
    );
    inProgress = false;
    setState(() {});

    if(response.isSuccess){
      showSnackBarMessage(context, "Login with your new password");
      _onTapLoginScreen();
    }else{
      showSnackBarMessage(context, response.errorMessage);
    }
  }


  void _onTapLoginScreen(){
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context)=>const LoginScreen()),
            (value)=>false);
  }

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
