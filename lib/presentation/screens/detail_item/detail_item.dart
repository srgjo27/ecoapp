import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/store.dart';
import '../../../shared/colors.dart';
import '../../../shared/typography.dart';
import 'widget/button_add_cart.dart';
import 'widget/quantity_selector.dart';
import 'widget/star_rating.dart';

class DetailItemScreen extends StatelessWidget {
  final Product product;

  const DetailItemScreen({super.key, required this.product});

  String formatPrice(double price) {
    final formatCurrency = NumberFormat.currency(locale: 'en_US', symbol: '\$');
    return formatCurrency.format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColorsTheme.secondary,
            ),
          ),
          _backgroundImage(),
          _draggableDetailContent(),
          _actionBar(context),
        ],
      ),
    );
  }

  Widget _actionBar(BuildContext context) {
    return Positioned(
      top: 16.h,
      left: 4.w,
      right: 4.w,
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColorsTheme.text,
            ),
          ),
        ],
      ),
    );
  }

  Widget _backgroundImage() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColorsTheme.primaryLight,
      ),
      width: double.infinity,
      height: 500.h,
      child: product.image.isNotEmpty
          ? Image.asset(product.image)
          : const Icon(
              Icons.image_not_supported,
              size: 100,
              color: AppColorsTheme.primaryDark,
            ),
    );
  }

  Widget _draggableDetailContent() {
    return DraggableScrollableSheet(
      initialChildSize: 0.46.h,
      minChildSize: 0.46.h,
      maxChildSize: 0.87.h,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            color: AppColorsTheme.secondary,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatPrice(product.price),
                            style: CustomTypography.poppinsSemiBold.copyWith(
                              fontSize: 18.sp,
                              color: AppColorsTheme.primaryDark,
                            ),
                          ),
                          product.isWishlist
                              ? Icon(Icons.favorite,
                                  color: const Color(0xFFFE585A), size: 20.sp)
                              : Icon(Icons.favorite_border,
                                  color: AppColorsTheme.hintText, size: 20.sp),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        product.name,
                        style: CustomTypography.poppinsSemiBold.copyWith(
                          fontSize: 20.sp,
                          color: AppColorsTheme.text,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        product.weight,
                        style: CustomTypography.poppinsMedium.copyWith(
                          fontSize: 12.sp,
                          color: AppColorsTheme.hintText,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      const StarRatingWidget(starCount: 5, rating: 4.5),
                      SizedBox(height: 8.h),
                      Text(
                        "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing",
                        style: CustomTypography.poppinsRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppColorsTheme.hintText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              const QuantitySelector(),
              SizedBox(height: 8.h),
              ButtonAddCart(
                onPressed: () {},
                title: 'Add to Cart',
              ),
            ],
          ),
        );
      },
    );
  }
}
