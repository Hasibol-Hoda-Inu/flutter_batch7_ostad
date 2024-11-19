import 'package:firebase_practice/auth/auth_service.dart';
import 'package:firebase_practice/presentation/home_screen.dart';
import 'package:firebase_practice/presentation/utils/email_validation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'sign_up_screen.dart';
import 'utils/app_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailTEController = TextEditingController();
  TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _auth = AuthService();
  bool _inProgressLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login", style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600
              ),),
              const SizedBox(height: 36,),
              Form(
                key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailTEController,
                        validator: (value)=>value!.isValidEmail()?null:"Enter a valid email",
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "yourmail@gmail.com",
                          label: Text("Email"),
                        ),
                      ),
                      const SizedBox(height: 16,),
                      TextFormField(
                        controller: _passwordTEController,
                        obscureText: true,
                        validator: (value)=> value!= null && value.length < 8? "Password must contain 8 characters min": null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: "your password",
                          label: Text("Password")
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 24,),
              Visibility(
                visible: !_inProgressLogin,
                replacement: const Center(child: CircularProgressIndicator(),),
                child: ElevatedButton(
                    onPressed: (){
                      onTapNextScreen();
                    },
                    style: ElevatedButton.styleFrom(),
                    child: const Text("Login", style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    )),
              ),
              const SizedBox(height: 32,),
              RichText(text: TextSpan(
                  text: "Don't have an account? ", style: const TextStyle(
                color: Colors.black,
              ),
                  children: [
                    TextSpan(
                        text: "Sign up", style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                    ),
                        recognizer: TapGestureRecognizer()..onTap = _onTapSignUpScreen
                    ),
                  ]
              ))
            ],
          ),
        ),
      ),
    );
  }

  void onTapNextScreen(){
    if(!_formKey.currentState!.validate()){
      return;
    }
    onTapLoginMethod();
  }

  void onTapLoginMethod() async {
    _inProgressLogin = true;
    setState(() {});
    final user = await _auth.loginWithEmailAndPassword(
        _emailTEController.text.trim(), _passwordTEController.text);
    if (user != null) {
      _inProgressLogin = false;
      setState(() {});
      debugPrint("Successfully logged in");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Login successful", style: TextStyle(color: Colors.white),),
        backgroundColor: AppColor.primaryColor,
      ),
      );
      clearText();
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const HomeScreen()), (predicate)=>false);
    }
  }

  void _onTapSignUpScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
  }

  void clearText(){
    _emailTEController.clear();
    _passwordTEController.clear();
  }
  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}

