import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/colors.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String icon;
  final bool obscureText = false;

  const CustomInputField({
    super.key,
    this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.icon,
    obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColorsTheme.hintText,
          fontSize: 14.sp,
        ),
        filled: true,
        fillColor: AppColorsTheme.background,
        prefixIcon: Padding(
          padding: EdgeInsets.all(14.w),
          child: SizedBox(
            width: 16.w,
            child: SvgPicture.asset(
              icon,
              fit: BoxFit.contain,
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColorsTheme.border,
            width: 1.5.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColorsTheme.primaryDark,
            width: 1.5.w,
          ),
        ),
      ),
    );
  }
}
