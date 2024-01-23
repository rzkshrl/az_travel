import 'package:az_travel/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Widget formInput({
  required Key key,
  required TextEditingController textEditingController,
  required String hintText,
  required IconData iconPrefix,
  required TextInputType? keyboardType,
  required String? Function(String?)? validator,
}) {
  FocusScopeNode currentFocus = FocusScope.of(Get.context!);
  return Form(
    key: key,
    child: SizedBox(
      height: 10.h,
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType,
        validator: validator,
        onTap: () {
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        onTapOutside: (event) {
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(Get.context!).textTheme.displaySmall!.copyWith(
                fontSize: 12.sp,
              ),
          isDense: true,
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: 1.w,
              right: 0.8.w,
            ),
            child: Align(
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: Icon(
                iconPrefix,
                size: 18,
                color: Theme.of(Get.context!).iconTheme.color,
              ),
            ),
          ),
          filled: true,
          fillColor: Theme.of(Get.context!).cardColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: black, width: 0.5),
          ),
        ),
      ),
    ),
  );
}
