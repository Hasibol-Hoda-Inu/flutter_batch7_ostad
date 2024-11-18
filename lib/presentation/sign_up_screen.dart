import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../auth/auth_service.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
              const Text(
                "Sign up",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 36,),
              Form(
                key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameTEController,
                        decoration: const InputDecoration(
                            hintText: "your name",
                            label: Text("Name")
                    ),
                  ),
                      const SizedBox(
                        height: 12,
                  ),
                      TextFormField(
                        controller: _emailTEController,
                        decoration: const InputDecoration(
                          hintText: "yourmail@gmail.com",
                          label: Text("Email")
                    ),
                  ),
                      const SizedBox(
                    height: 12,
                  ),
                      TextFormField(
                        controller: _passwordTEController,
                        validator: (value)=>value!.length<8?"Password must be 8 characters long":null,
                        decoration: const InputDecoration(
                            hintText: "your password",
                            label: Text("Password"),
                        ),
                  ),
                ],
              )),
              const SizedBox(height: 24,),
              ElevatedButton(
                  onPressed: () {
                    onTapNextScreen();
                  },
                  child: const Text("Sign up", style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  ),
              ),
              const SizedBox(height: 32,),
              RichText(
                  text: TextSpan(
                      text: "Already have an account? ",
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                    TextSpan(
                        text: "Sign in",
                        style: const TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _onTapLoginScreen),
                  ]))
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
    onTapSignUpMethod();
  }

  void onTapSignUpMethod() async {
    final user = await _auth.signUpWithEmailAndPassword(
        _emailTEController.text.trim(), _passwordTEController.text);
    if (user != null) {
      debugPrint("User created successfully");
      ScaffoldMessenger.of(context).showSnackBar(const
      SnackBar(
        content: Text("User registration successful", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purpleAccent,
      ),
      );
      clearText();
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginScreen()), (predicate)=>false);
    }
  }

  void clearText() {
    _nameTEController.clear();
    _emailTEController.clear();
    _passwordTEController.clear();
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }

  void _onTapLoginScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
