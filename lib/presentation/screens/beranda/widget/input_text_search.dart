import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/colors.dart';
import '../../../../shared/typography.dart';

class InputTextSearch extends StatefulWidget {
  const InputTextSearch({super.key});

  @override
  State<InputTextSearch> createState() => _InputTextSearchState();
}

class _InputTextSearchState extends State<InputTextSearch> {
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColorsTheme.secondary,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: AppColorsTheme.hintText),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              focusNode: _searchFocusNode,
              decoration: InputDecoration(
                hintText: 'Search keywords..',
                border: InputBorder.none,
                hintStyle: CustomTypography.poppinsMedium.copyWith(
                  fontSize: 12.sp,
                  color: AppColorsTheme.hintText,
                ),
              ),
            ),
          ),
          const Icon(Icons.tune, color: AppColorsTheme.hintText),
        ],
      ),
    );
  }
}
