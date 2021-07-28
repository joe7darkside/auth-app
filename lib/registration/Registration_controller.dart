import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

class RegistrationController extends GetxController {
  var googleSignInAccount = Rx<GoogleSignInAccount?>(null);
  final email = TextEditingController();
  final password = TextEditingController();
  // final formKey = GlobalKey<FormState>();
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
    // final googleUser = await GoogleSignIn().signIn();
    googleSignInAccount.value = await GoogleSignIn().signIn();
    //   final googleAuth = await googleUser!.authentication;
    //   final credential = GoogleAuthProvider.credential(
    //       accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    //   return await FirebaseAuth.instance.signInWithCredential(credential);
    // }
  }
}
