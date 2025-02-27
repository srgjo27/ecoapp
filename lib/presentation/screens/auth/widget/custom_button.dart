import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/colors.dart';
import '../../../../shared/typography.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          backgroundColor: AppColorsTheme.primaryDark,
          disabledBackgroundColor: AppColorsTheme.devider,
        ),
        child: Text(
          title ?? '',
          style: CustomTypography.poppinsMedium.copyWith(
            color: AppColorsTheme.background,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
