import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var googleSignInAccount = Rx<GoogleSignInAccount?>(null);
  final email = TextEditingController();
  final password = TextEditingController();
  late StreamSubscription<User?> user;

  @override
  void onInit() {
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    email.text = "";
    password.text = "";
    super.onInit();
  }

  @override
  void onClose() {
    // user.cancel();
    email.dispose();
    password.dispose();
    super.onClose();
  }

//Signout
  signout() async {
    try {
      await auth.FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      Get.offAllNamed(
        '/signIn',
      );
    } catch (e) {
      print(e);
    }
  }

//Registration with email and password
  void create() async {
    try {
      auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      Get.toNamed('/homePage');
    } on auth.FirebaseAuthException catch (e) {
      print(e);
      // if (e.code == 'weak-password') {
      //   print('The password provided is too weak.');
      // } else if (e.code == 'email-already-in-use') {
      //   print('The account already exists for that email.');
      // }
    }
  }

//Registration with google
  Future signWithgoogle() async {
    try {
      googleSignInAccount.value = await GoogleSignIn().signIn();

      Get.toNamed('/homePage');
    } on auth.FirebaseAuthException catch (e) {
      print(e);
    }
  }

// //Signout from google
//   void signOutGoogle() {
//     GoogleSignIn().signOut();
//   }

//Signin
  void signIn() async {
    try {
      auth.FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Get.toNamed('/homePage');
    } on auth.FirebaseAuthException catch (e) {
      print(e);

      // if (e.code == 'weak-password') {
      //   print('The password provided is too weak.');
      // } else if (e.code == 'email-already-in-use') {
      //   print('The account already exists for that email.');
      // }
    }
  }
}
