// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class LoginController extends GetxController {
//   var inst = FirebaseAuth.instance;
//   final formKey = GlobalKey<FormState>();
//   var googleAccount = Rx<GoogleSignInAccount?>(null);
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   var isLogin = false.obs;

//   signout() async {
//     inst.signOut();
//     isLogin.value = false;
//   }

//   signOutWithgoogle() async {
//     googleAccount.value = await GoogleSignIn().signOut();
//     isLogin.value = false;
//   }

//   signinWithGoogle() async {
//     googleAccount.value = await GoogleSignIn().signIn();
//     isLogin.value = true;
//   }

//   loginWithEmail() async {
//     try {
//       // UserCredential userCredential =
//       await inst.signInWithEmailAndPassword(
//           email: email.text, password: password.text);
//       isLogin.value = true;
//     } on FirebaseAuthException catch (e) {
//       print(e);
//       if (e.code == 'user-not-found') {
//         // ignore: avoid_print
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         // ignore: avoid_print
//         print('Wrong password provided for that user.');
//       }
//     }
//   }

//   registerWithEmail() async {
//     try {
//       await inst.createUserWithEmailAndPassword(
//           email: email.text, password: password.text);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }
