import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/presentation/screens/onboarding_screens/email_verification_screen.dart';
import 'package:task_manager/presentation/screens/onboarding_screens/sign_in_screen.dart';
import 'package:task_manager/presentation/utils/snackbar.dart';
import 'package:task_manager/presentation/widgets/screen_background.dart';

import '../../../data/utils/urls.dart';
import '../../utils/app_colors.dart';
import '../../widgets/center_circular_progress_indicator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailTEController = TextEditingController();
  TextEditingController _firstNameTEController = TextEditingController();
  TextEditingController _lastNameTEController = TextEditingController();
  TextEditingController _mobileTEController = TextEditingController();
  TextEditingController _passwordTEController = TextEditingController();

  bool _inProgress = false;

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
    return Form(
      key: _formKey,
      child: Column(children: [
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _emailTEController,
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter a valid email";
                      } return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                            color: Colors.grey
                        )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _firstNameTEController,
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter your name";
                      } return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        hintText: "First name",
                        hintStyle: TextStyle(
                            color: Colors.grey
                        )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _lastNameTEController,
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter your name";
                      }return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        hintText: "Last name",
                        hintStyle: TextStyle(
                            color: Colors.grey
                        )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _mobileTEController,
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter valid Number";
                      }return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        hintText: "Mobile",
                        hintStyle: TextStyle(
                            color: Colors.grey
                        )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _passwordTEController,
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter valid password";
                      } return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                            color: Colors.grey
                        )
                    ),
                  ),
                  _buildOnTapNextButton()
                ],),
    );
  }

  Column _buildOnTapNextButton() {
    return Column(children: [
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: Visibility(
                    visible: !_inProgress,
                    replacement: const CenterCircularProgressIndicator(),
                    child: ElevatedButton(
                        onPressed: _onTapNavigateToEmailVerificationScreen,
                        child: const Icon(Icons.arrow_circle_right_outlined,
                            color: Colors.white,
                            size: 26)
                    ),
                  ),
                ),
                const SizedBox(height: 60,),
              ],);
  }

  void _onTapNavigateToEmailVerificationScreen(){
    if(!_formKey.currentState!.validate()){
      return;
    }
    _signUp();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
  }

  Future<void> _signUp() async {
    _inProgress = true;
    setState(() {});

    Map<String, dynamic> requestBody={
      "email":_emailTEController.text.trim(),
      "firstName":_firstNameTEController.text.trim(),
      "lastName":_lastNameTEController.text.trim(),
      "mobile":_mobileTEController.text.trim(),
      "password":_passwordTEController.text,
    };
    NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.registerUrl,
        body: requestBody,
    );
    _inProgress = false;
    setState(() {});

    if(response.isSuccess){
      showSnackBarMessage(context, "Registration successful");
      onTapFormTextClear();
    }else{
      showSnackBarMessage(context, response.errorMessage, true,);
    }

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

  void onTapFormTextClear(){
    _emailTEController.clear();
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _mobileTEController.clear();
    _passwordTEController.clear();
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
