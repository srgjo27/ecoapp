import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_path.dart';
import '../../../../core/utils/store.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/typography.dart';

class CategoriesScroll extends StatelessWidget {
  const CategoriesScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Categories',
              style: CustomTypography.poppinsSemiBold.copyWith(
                fontSize: 18,
                color: AppColorsTheme.text,
              ),
            ),
            InkWell(
              onTap: () {
                context.push(AppPath.categoriesScreen);
              },
              child: Icon(
                Icons.keyboard_arrow_right,
                color: AppColorsTheme.hintText,
                size: 28.sp,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: SizedBox(
            height: 100.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => SizedBox(width: 16.w),
              itemBuilder: (context, index) {
                final category = categories[index];
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12.h),
                      decoration: BoxDecoration(
                        color: category['color'] as Color?,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        category['icon'] as String,
                        width: 32.sp,
                        height: 32.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      category['label'] as String,
                      style: CustomTypography.poppinsRegular.copyWith(
                        fontSize: 12.sp,
                        color: AppColorsTheme.text,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
