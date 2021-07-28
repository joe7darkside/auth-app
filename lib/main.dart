import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_pages/home_page.dart';
import 'registration/Registration_page.dart';
import 'forgot_password/forgot_password_page.dart';
import 'signin/signin_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/registration',
      getPages: [
        GetPage(
          name: '/registration',
          page: () => RegistrationPage(),
        ),
        GetPage(
            name: '/signIn',
            page: () => SignInPage(),
            transition: Transition.cupertino,
            transitionDuration: Duration(milliseconds: 700)),
        GetPage(
            name: '/forgotPassword',
            page: () => ForgotPasswordPage(),
            transition: Transition.cupertino,
            transitionDuration: Duration(milliseconds: 700)),
        GetPage(
            name: '/homePage',
            page: () => HomePage(),
            transition: Transition.cupertino,
            transitionDuration: Duration(milliseconds: 700)),
      ],
    );
  }
}
