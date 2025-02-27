import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/colors.dart';
import '../../../../shared/typography.dart';

class ListCategory extends StatelessWidget {
  final String icon;
  final String label;
  final Color? color;

  const ListCategory({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColorsTheme.background,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColorsTheme.border, width: 1.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 24.r,
            child: SvgPicture.asset(icon, width: 24.w, height: 24.h),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: CustomTypography.poppinsMedium
                .copyWith(fontSize: 12.sp, color: AppColorsTheme.hintText),
          ),
        ],
      ),
    );
  }
}
