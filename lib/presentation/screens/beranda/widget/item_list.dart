import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/routes/app_path.dart';
import '../../../../core/utils/store.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/typography.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Featured Products',
              style: CustomTypography.poppinsSemiBold.copyWith(
                fontSize: 18.sp,
                color: AppColorsTheme.text,
              ),
            ),
            InkWell(
              onTap: () {
                context.push(AppPath.itemScreen);
              },
              child: Icon(
                Icons.keyboard_arrow_right,
                color: AppColorsTheme.hintText,
                size: 28.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
            childAspectRatio: 0.6.w,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context.push(AppPath.detailItemScreen, extra: products[index]);
              },
              child: ItemListDetail(product: products[index]),
            );
          },
        ),
      ],
    );
  }
}

class ItemListDetail extends StatelessWidget {
  final Product product;

  const ItemListDetail({super.key, required this.product});

  String formatPrice(double price) {
    final formatCurrency = NumberFormat.currency(locale: 'en_US', symbol: '\$');
    return formatCurrency.format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColorsTheme.background,
        border: Border.all(color: AppColorsTheme.border, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.h),
                child: Center(
                  child: product.image.isNotEmpty
                      ? Image.asset(
                          product.image,
                          width: 80.w,
                          height: 80.h,
                          fit: BoxFit.contain,
                        )
                      : Icon(Icons.image_not_supported,
                          size: 40.w, color: AppColorsTheme.primary),
                ),
              ),
              if (product.isNew)
                Positioned(
                  top: 0.h,
                  left: 0.w,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: const BoxDecoration(color: Color(0xFFFDEFD5)),
                    child: Text(
                      "NEW",
                      style: CustomTypography.poppinsMedium.copyWith(
                        fontSize: 10.sp,
                        color: const Color(0xFFE8AD41),
                      ),
                    ),
                  ),
                ),
              if (product.discount > 0)
                Positioned(
                  top: 0.h,
                  left: 0.w,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: const BoxDecoration(color: Color(0xFFFEE4E4)),
                    child: Text(
                      "-${product.discount}%",
                      style: CustomTypography.poppinsMedium.copyWith(
                        fontSize: 10.sp,
                        color: const Color(0xFFF56262),
                      ),
                    ),
                  ),
                ),
              Positioned(
                top: 0.h,
                right: 0.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  child: product.isWishlist
                      ? Icon(Icons.favorite,
                          color: const Color(0xFFFE585A), size: 20.sp)
                      : Icon(Icons.favorite_border,
                          color: AppColorsTheme.secondary, size: 20.sp),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                Text(
                  formatPrice(product.price),
                  style: CustomTypography.poppinsSemiBold.copyWith(
                    fontSize: 14.sp,
                    color: AppColorsTheme.primaryDark,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  product.name,
                  style: CustomTypography.poppinsSemiBold.copyWith(
                    fontSize: 14.sp,
                    color: AppColorsTheme.text,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  product.weight,
                  style: CustomTypography.poppinsRegular.copyWith(
                    fontSize: 12.sp,
                    color: AppColorsTheme.hintText,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 1.h,
            color: AppColorsTheme.border,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Icon(
            //       Icons.remove,
            //       color: AppColorsTheme.secondary,
            //       size: 20.sp,
            //     ),
            //     Text(
            //       "1",
            //       style: CustomTypography.poppinsSemiBold.copyWith(
            //         fontSize: 14.sp,
            //         color: AppColorsTheme.text,
            //       ),
            //     ),
            //     Icon(
            //       Icons.add,
            //       color: AppColorsTheme.primaryDark,
            //       size: 20.sp,
            //     ),
            //   ],
            // ),
            child: InkWell(
              onTap: () {
                context.push(AppPath.cartScreen);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: AppColorsTheme.primaryDark,
                    size: 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "Add to cart",
                    style: CustomTypography.poppinsMedium.copyWith(
                      fontSize: 14.sp,
                      color: AppColorsTheme.text,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
