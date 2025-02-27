import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/store.dart';
import '../../../shared/colors.dart';
import '../../../shared/typography.dart';
import 'widget/category_list.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Categories',
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return ListCategory(
                icon: category['icon'],
                label: category['label'],
                color: category['color'],
              );
            },
          ),
        ),
      ),
    );
  }
}
