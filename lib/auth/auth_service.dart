import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  Future<void> signOut()async {
    try{
      await _auth.signOut();
    }catch(e){
      debugPrint('Something went wrong');
    }
  }
}