import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/colors.dart';
import '../../../../shared/typography.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColorsTheme.background,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColorsTheme.border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Quantity",
              style: CustomTypography.poppinsMedium
                  .copyWith(fontSize: 12.sp, color: AppColorsTheme.hintText)),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove,
                    color: AppColorsTheme.primaryDark, size: 20.sp),
              ),
              Container(
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    vertical: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: Text(
                  "0",
                  style:
                      CustomTypography.poppinsMedium.copyWith(fontSize: 14.sp),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add,
                    color: AppColorsTheme.primaryDark, size: 20.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
