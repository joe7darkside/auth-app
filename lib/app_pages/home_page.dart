import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one/registration/auth_controller.dart';

import '../connection_controller.dart';

class HomePage extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());
  final ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: IconButton(
            onPressed: () {
              if (connectivityController.connectionStatus.value) {
                controller.signout();
              }
            },
            icon: Icon(Icons.logout),
          ),
        ),
      ),
    );
  }
}
