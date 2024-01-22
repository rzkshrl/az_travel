import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  var currentIndex = 0.obs;

  changePage(int i) {
    currentIndex.value = i;
  }

  late final AnimationController cAniDashboard;
  bool isDashboardClicked = false;

  late final AnimationController cAniHistory;
  bool isHistoryClicked = false;

  late final AnimationController cAniProfile;
  bool isProfileClicked = false;

  @override
  void onInit() {
    super.onInit();
    cAniDashboard = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 70),
    );
    cAniHistory = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 70),
    );
    cAniProfile = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 70),
    );
  }
}
