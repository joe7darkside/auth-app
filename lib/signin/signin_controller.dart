// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart' as auth;

// class SignInController extends GetxController {
//   final email = TextEditingController();
//   final password = TextEditingController();
//   // final formKey = GlobalKey<FormState>();
//   @override
//   void onInit() {
//     email.text = "";
//     password.text = "";
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     email.dispose();
//     password.dispose();
//     super.onClose();
//   }

//   void signIn() async {
//     try {
//       auth.FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email.text, password: password.text);
//     } on auth.FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     }
//   }
// }
