import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/welcome_screen_controller.dart';

class WelcomeScreenView extends GetView<WelcomeScreenController> {
  const WelcomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WelcomeScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WelcomeScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
