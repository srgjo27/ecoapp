import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/store.dart';
import '../../../../shared/colors.dart';

class HeaderCarousel extends StatelessWidget {
  const HeaderCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        onPageChanged: (index, reason) {},
      ),
      items: images.map((image) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColorsTheme.border,
              width: 1,
            ),
          ),
          child: Icon(
            Icons.image_not_supported,
            size: 40.w,
            color: AppColorsTheme.primary,
          ),
        );
      }).toList(),
    );
  }
}
