import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/presentation/screens/main_bottom_nav_screen.dart';

import '../../utils/app_colors.dart';
import '../../widgets/screen_background.dart';
import 'sign_in_screen.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
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
              Text("Pin verification",
                style: textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold),),
              Text('A 6 digit verification pi will send to your email address',
                style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 20,),
              PinCodeTextField(
                length: 6,
                obscureText: false,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  inactiveColor: Colors.transparent,

                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                appContext: context,
              ),
              _buildOnTapSubmissionMethod(),
              _signInSectionMethod()
            ],
          ),
        ),),
    );
  }

  Widget _buildOnTapSubmissionMethod() {
    return Column(children: [
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: _onTapNavigateToBNS,
                    child: const Text("Verify", style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),)
                ),
              ),
              const SizedBox(height: 60,),
            ],);
  }

  void _onTapNavigateToBNS(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainBottomNavScreen()));
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
