import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_path.dart';
import '../../../core/utils/store.dart';
import '../../../shared/colors.dart';
import '../../../shared/typography.dart';
import 'widget/item_list_detail.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Vegetables',
          style: CustomTypography.poppinsMedium.copyWith(fontSize: 16.sp),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColorsTheme.secondary,
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 0.7,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.push(AppPath.detailItemScreen,
                      extra: products[index]);
                },
                child: ItemListDetail(product: products[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
