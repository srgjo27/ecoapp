import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../core/constants/img_string.dart';
import '../../../core/routes/app_path.dart';
import '../../../shared/colors.dart';
import '../../../shared/typography.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: _buildOnboardingPages(),
      showSkipButton: true,
      skip: _buildButtonText("Skip", AppColorsTheme.textSecondary),
      next: _buildButtonText("Next", AppColorsTheme.primaryDark),
      done: _buildButtonText("Done", AppColorsTheme.primaryDark),
      onDone: () => context.go(AppPath.loginScreen),
    );
  }

  List<PageViewModel> _buildOnboardingPages() {
    const String loremIpsumText =
        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy";

    return [
      _buildPageViewModel(
        title: "Buy Grocery",
        imageAsset: ImgString.onboardingSlideOne,
        body: loremIpsumText,
      ),
      _buildPageViewModel(
        title: "Fast Delivery",
        imageAsset: ImgString.onboardingSlideTwo,
        body: loremIpsumText,
      ),
      _buildPageViewModel(
        title: "Enjoy Quality Product",
        imageAsset: ImgString.onboardingSlideThree,
        body: loremIpsumText,
      ),
    ];
  }

  PageViewModel _buildPageViewModel({
    required String title,
    required String imageAsset,
    required String body,
  }) {
    return PageViewModel(
      title: title,
      body: body,
      image: Image.asset(imageAsset),
      decoration: _buildPageDecoration(),
    );
  }

  PageDecoration _buildPageDecoration() {
    return PageDecoration(
      titleTextStyle: CustomTypography.poppinsBold.copyWith(fontSize: 20.sp),
      bodyTextStyle: CustomTypography.poppinsRegular.copyWith(
        fontSize: 12.sp,
        color: AppColorsTheme.textSecondary,
      ),
      imageFlex: 3,
      imagePadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.only(top: 64.h, bottom: 20.h),
    );
  }

  Text _buildButtonText(String text, Color color) {
    return Text(
      text,
      style: CustomTypography.poppinsMedium.copyWith(
        fontSize: 14.sp,
        color: color,
      ),
    );
  }
}
