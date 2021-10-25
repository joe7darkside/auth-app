import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var googleSignInAccount = Rx<GoogleSignInAccount?>(null);
  final email = TextEditingController();
  final password = TextEditingController();
  // final formKey = GlobalKey<FormState>();
  var isLogin = false.obs;
  signout() async {
    auth.FirebaseAuth.instance.signOut();
    isLogin.value = false;
  }

  @override
  void onInit() {
    email.text = "";
    password.text = "";
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

//Registration with email and password
  void create() async {
    try {
      auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      isLogin.value = true;
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
  }

//Registration with google
  Future signWithgoogle() async {
    googleSignInAccount.value = await GoogleSignIn().signIn();
    isLogin.value = true;
  }

  void signIn() async {
    try {
      auth.FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
  }
}
