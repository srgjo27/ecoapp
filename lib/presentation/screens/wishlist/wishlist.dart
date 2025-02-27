import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/colors.dart';
import '../../../shared/typography.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Favorites',
            style: CustomTypography.poppinsMedium.copyWith(fontSize: 16.sp),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: AppColorsTheme.secondary,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16.w),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          color: AppColorsTheme.textError,
                          child: const Icon(Icons.delete,
                              color: AppColorsTheme.background),
                        ),
                        onDismissed: (direction) {
                          // Handle item removal
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: const BoxDecoration(
                            color: AppColorsTheme.background,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.image_not_supported,
                                size: 40.w,
                                color: AppColorsTheme.primary,
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '0.00',
                                      style: CustomTypography.poppinsSemiBold
                                          .copyWith(
                                        fontSize: 12.sp,
                                        color: AppColorsTheme.primaryDark,
                                      ),
                                    ),
                                    Text(
                                      'Product Name',
                                      style: CustomTypography.poppinsSemiBold
                                          .copyWith(
                                        fontSize: 14.sp,
                                        color: AppColorsTheme.text,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      '1.5 lbs',
                                      style: CustomTypography.poppinsRegular
                                          .copyWith(
                                        fontSize: 12.sp,
                                        color: AppColorsTheme.hintText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      size: 20.sp,
                                      color: AppColorsTheme.primaryDark,
                                    ),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    '5',
                                    style:
                                        CustomTypography.poppinsMedium.copyWith(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      size: 20.sp,
                                      color: AppColorsTheme.primaryDark,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
