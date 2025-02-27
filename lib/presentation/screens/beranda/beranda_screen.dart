import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/header_carousel.dart';
import 'widget/item_list.dart';
import 'widget/categories_list_sroll.dart';
import 'widget/input_text_search.dart';

class BerandaScreen extends ConsumerStatefulWidget {
  const BerandaScreen({super.key});

  @override
  ConsumerState<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends ConsumerState<BerandaScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.h),
              child: Column(
                children: [
                  const InputTextSearch(),
                  SizedBox(height: 16.h),
                  const HeaderCarousel(),
                  SizedBox(height: 16.h),
                  const CategoriesScroll(),
                  SizedBox(height: 16.h),
                  const ItemList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
