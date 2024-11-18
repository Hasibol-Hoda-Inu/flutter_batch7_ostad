import 'package:firebase_practice/auth/auth_service.dart';
import 'package:firebase_practice/presentation/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailTEController = TextEditingController();
  TextEditingController _passwordTEController = TextEditingController();
  final _auth = AuthService();
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
              Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailTEController,
                        decoration: const InputDecoration(
                          hintText: "Email",

                        ),
                      ),
                      TextFormField(
                        controller: _passwordTEController,
                        decoration: const InputDecoration(
                            hintText: "Password"
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 24,),
              ElevatedButton(
                  onPressed: (){
                    onTapSignUpMethod();
                  },
                  child: const Text("Login", style: TextStyle(fontSize: 18),)),
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

  void onTapSignUpMethod() async {
    final user = await _auth.loginWithEmailAndPassword(
        _emailTEController.text.trim(), _passwordTEController.text);
    if (user != null) {
      debugPrint("Successfully logged in");
      ScaffoldMessenger.of(context).showSnackBar(const
      SnackBar(
        content: Text("Login successful", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purpleAccent,
      ),
      );
      clearText();
      _onTapSignUpScreen();
    }
  }

  void _onTapSignUpScreen(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const HomeScreen()), (predicate)=>false);
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

