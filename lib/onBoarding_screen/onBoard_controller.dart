import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnBoardingController extends GetxController {
  final onboardingPagesList = [
    PageModel(
      widget: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/onBoarding/1.png',
            height: Adaptive.h(40),
            width: Adaptive.h(50),
          ),
          Spacer(),
          Container(
              width: double.infinity,
              child: Text('CCTV TOOLS ', style: pageTitleStyle)),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: double.infinity,
            child: Text(
              'Calculate the CCTV Storege, Bandwith, And More',
              style: pageInfoStyle,
            ),
          ),
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/onBoarding/2.png',
            height: Adaptive.h(40),
            width: Adaptive.h(50),
          ),
          Spacer(),
          Container(
              width: double.infinity,
              child: Text('CONTACT US', style: pageTitleStyle)),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: double.infinity,
            child: Text(
              'You can contact us for any Question',
              style: pageInfoStyle,
            ),
          ),
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/onBoarding/3.png',
            height: Adaptive.h(40),
            width: Adaptive.h(50),
          ),
          Spacer(),
          Container(
              width: double.infinity,
              child: Text('DRI', style: pageTitleStyle)),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: double.infinity,
            child: Text(
              'Calculate the Appropriate focal length for Detection, Recognition, Identification',
              style: pageInfoStyle,
            ),
          ),
        ],
      ),
    ),
  ];
}
