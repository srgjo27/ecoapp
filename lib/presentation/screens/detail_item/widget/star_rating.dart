import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/colors.dart';
import '../../../../shared/typography.dart';

class StarRatingWidget extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color? color;
  const StarRatingWidget({
    super.key,
    this.starCount = 5,
    this.rating = 0.0,
    this.color,
  });

  Widget buildStar(final BuildContext context, final int index) {
    Icon icon;

    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        size: 20.w,
        color: AppColorsTheme.border,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        size: 20.w,
        color: color ?? Colors.amber,
      );
    } else {
      icon = Icon(
        Icons.star,
        size: 20.w,
        color: color ?? Colors.amber,
      );
    }
    return icon;
  }

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        Text(
          rating.toString(),
          style: const TextStyle(
            color: AppColorsTheme.text,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 4.w),
        for (var i = 0; i < starCount; i++) buildStar(context, i),
        SizedBox(width: 4.w),
        Text(
          '(100 reviews)',
          style: CustomTypography.poppinsMedium.copyWith(
            color: AppColorsTheme.text,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
