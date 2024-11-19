import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  final _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try{
      final credentials = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credentials.user;
    }catch(e){
      debugPrint("Something went wrong $e");
    }
    return null;
  }

  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try{
      final credentials = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credentials.user;
    }catch(e){
      debugPrint("Something went wrong");
    }
    return null;
  }

  Future<UserCredential?>loginWithGoogle() async {
    try{
      debugPrint("Here I am");
      final googleUser = await GoogleSignIn().signIn();
      if(googleUser==null){
        debugPrint("Google sign-in cancelled by the user");
        return null;
      }
      final googleAuth = await googleUser.authentication;
      final credentials = GoogleAuthProvider.credential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      return await _auth.signInWithCredential(credentials);
    }catch(e){
      debugPrint("Error");
      debugPrint(e.toString());
    }
    return null;
  }

  Future<void> signOut()async {
    try{
      await _auth.signOut();
    }catch(e){
      debugPrint('Something went wrong');
    }
  }
}