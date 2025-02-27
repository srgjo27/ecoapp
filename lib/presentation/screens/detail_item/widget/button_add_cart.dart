import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/ic_string.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/typography.dart';

class ButtonAddCart extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;

  const ButtonAddCart({
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
          backgroundColor: AppColorsTheme.primaryDark,
          disabledBackgroundColor: AppColorsTheme.devider,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.add_shopping_cart_outlined,
              color: Colors.transparent,
              size: 20.sp,
            ),
            Text(
              title ?? '',
              style: CustomTypography.poppinsMedium.copyWith(
                color: AppColorsTheme.background,
                fontSize: 14.sp,
              ),
            ),
            SvgPicture.asset(
              IcString.shoppingBag,
              width: 16.w,
            )
          ],
        ),
      ),
    );
  }
}
