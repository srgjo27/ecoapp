import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/colors.dart';
import '../../../shared/typography.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Shopping Cart',
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
              _checkoutSection(),
            ],
          ),
        ));
  }

  Widget _checkoutSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: const BoxDecoration(
        color: AppColorsTheme.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: CustomTypography.poppinsMedium.copyWith(
                  fontSize: 12.sp,
                  color: AppColorsTheme.hintText,
                ),
              ),
              Text(
                '\$56.7',
                style: CustomTypography.poppinsMedium.copyWith(
                  fontSize: 12.sp,
                  color: AppColorsTheme.hintText,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping charges',
                style: CustomTypography.poppinsMedium.copyWith(
                  fontSize: 12.sp,
                  color: AppColorsTheme.hintText,
                ),
              ),
              Text(
                '\$1.6',
                style: CustomTypography.poppinsMedium.copyWith(
                  fontSize: 12.sp,
                  color: AppColorsTheme.hintText,
                ),
              ),
            ],
          ),
          Divider(thickness: 1.h, height: 16.h, color: AppColorsTheme.border),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style:
                    CustomTypography.poppinsSemiBold.copyWith(fontSize: 16.sp),
              ),
              Text(
                '\$58.2',
                style:
                    CustomTypography.poppinsSemiBold.copyWith(fontSize: 16.sp),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColorsTheme.primaryDark,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Checkout',
                style: CustomTypography.poppinsSemiBold.copyWith(
                    fontSize: 14.sp, color: AppColorsTheme.background),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
