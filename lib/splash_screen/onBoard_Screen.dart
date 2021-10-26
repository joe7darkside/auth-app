import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:get/get.dart';
import 'package:one/splash_screen/onBoard_controller.dart';

class OnBoardScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  final OnBoardController onBoardController = Get.put(OnBoardController());
  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      //print("nextButton pressed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OnBoard(
        onDone: () => Get.toNamed('/signIn'),
        onBoardData: onBoardController.onBoardData,
        pageController: _pageController,
        titleStyles: TextStyle(
          color: Colors.blue[700],
          fontSize: 18,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.15,
        ),
        descriptionStyles: TextStyle(
          fontSize: 16,
          color: Colors.brown.shade300,
        ),
        pageIndicatorStyle: PageIndicatorStyle(
          width: 100,
          inactiveColor: Colors.blue[700],
          activeColor: Colors.blue[700],
          inactiveSize: Size(8, 8),
          activeSize: Size(12, 12),
        ),
        skipButton: TextButton(
          onPressed: () => Get.toNamed('/signIn'),
          child: Text(
            "Skip",
            style: TextStyle(color: Colors.blue[700]),
          ),
        ),
      ),
    );
  }
}
