import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/presentation/controllers/auth_controller.dart';
import 'package:task_manager/presentation/screens/main_bottom_nav_screen.dart';
import 'package:task_manager/presentation/screens/onboarding_screens/reset_password_screen.dart';
import 'package:task_manager/presentation/utils/app_colors.dart';
import 'package:task_manager/presentation/widgets/center_circular_progress_indicator.dart';
import 'package:task_manager/presentation/widgets/screen_background.dart';

import '../../../data/utils/urls.dart';
import '../../utils/snackbar.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  bool _inProgress = false;

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
    return Form(
      key: _formKey,
      child: Column(children: [
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter a valid email";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                            color: Colors.grey
                        )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter your password";
                      }
                      if(value!.length <=6){
                        return "Enter a password more than 6 characters";
                      }
                      return null;
                    },
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
                    child: Visibility(
                      visible: !_inProgress,
                      replacement: const CenterCircularProgressIndicator(),
                      child: ElevatedButton(
                          onPressed: _onTabNextButton,
                          child: const Icon(Icons.arrow_circle_right_outlined,
                              color: Colors.white,
                              size: 26,
                          )
                      ),
                    ),
                  ),
                ],),
    );
  }
  void _onTabNextButton(){
    if(!_formKey.currentState!.validate()){
      return;
    }
    _signIn();
  }

  Future<void> _signIn()async {
    _inProgress = true;
    setState(() {});

    Map<String, dynamic> reqBody = {
      "email": _emailTEController.text.trim(),
      "password": _passwordTEController.text,
    };
    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.signInUrl,
        body: reqBody,
    );

    _inProgress = false;
    setState(() {});
    if(response.isSuccess){
      await AuthController.saveAccessToken(response.responseData["token"]);

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (BuildContext context)=>const MainBottomNavScreen()),
              (value)=>false);
    }else{
      showSnackBarMessage(context, response.errorMessage, true);
    }
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
