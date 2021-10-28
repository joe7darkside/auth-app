import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one/verifying_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_pages/home_page.dart';
import 'onBoarding_screen/onBoard_Screen.dart';
import 'registration/Registration_page.dart';
import 'forgot_password/forgot_password_page.dart';
import 'signin/signin_page.dart';

// int? isViewed;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // isViewed = prefs.getInt('onBoard');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? '/onBoard'
            : '/homePage',
        getPages: [
          GetPage(
              name: '/verifying',
              page: () => Verifying(),
              transition: Transition.cupertino,
              transitionDuration: Duration(milliseconds: 700)),
          GetPage(
              name: '/onBoard',
              page: () => OnBoarding(),
              transition: Transition.cupertino,
              transitionDuration: Duration(milliseconds: 700)),
          GetPage(
              name: '/registration',
              page: () => RegistrationPage(),
              transition: Transition.cupertino,
              transitionDuration: Duration(milliseconds: 700)),
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
    });
  }
}
