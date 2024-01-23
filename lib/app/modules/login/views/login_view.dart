import 'package:az_travel/app/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/theme.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authC = AuthController();
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SvgPicture.asset(
                    'assets/images/Login.svg',
                    width: 100.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 17.h),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/Logo.svg',
                        width: 35.w,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      authC.signInGoogle();
                    },
                    child: Container(
                      width: 75.w,
                      height: 7.h,
                      decoration: BoxDecoration(
                        color: yellow1_F9B401,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(right: 5.w, left: 5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Sign in with Google'),
                            SvgPicture.asset(
                              'assets/images/google_logo.svg',
                              width: 5.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
