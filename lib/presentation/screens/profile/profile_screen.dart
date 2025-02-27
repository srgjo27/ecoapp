import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/ic_string.dart';
import '../../../shared/colors.dart';
import '../../../shared/typography.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
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
          Container(
            width: double.infinity,
            height: 100.h,
            decoration: const BoxDecoration(
              color: AppColorsTheme.background,
            ),
          ),
          Positioned(
            top: 50.h,
            left: 0.w,
            right: 0.w,
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundColor: AppColorsTheme.textSecondary,
                      child: Icon(
                        Icons.person,
                        size: 50.r,
                        color: AppColorsTheme.text,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 15.r,
                        backgroundColor: AppColorsTheme.primaryDark,
                        child: Icon(
                          Icons.camera_alt,
                          size: 15.r,
                          color: AppColorsTheme.background,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  'Olivia Austin',
                  style: CustomTypography.poppinsSemiBold
                      .copyWith(fontSize: 16.sp),
                ),
                Text(
                  'oliviaaustin@gmail.com',
                  style: CustomTypography.poppinsRegular.copyWith(
                    fontSize: 12.sp,
                    color: AppColorsTheme.hintText,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 200.h,
            left: 0.w,
            right: 0.w,
            bottom: 0.h,
            child: _buildMenuList(),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuList() {
    final List<Map<String, dynamic>> menuItems = [
      {'icon': IcString.userCircle, 'label': 'About me'},
      {'icon': IcString.package, 'label': 'My Orders'},
      {'icon': IcString.wishlist, 'label': 'My Favorites'},
      {'icon': IcString.pinPoin, 'label': 'My Address'},
      {'icon': IcString.transaction, 'label': 'Transactions'},
      {'icon': IcString.notification, 'label': 'Notifications'},
      {'icon': IcString.leftCircleArrow, 'label': 'Sign out', 'isLogout': true},
    ];

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return ListTile(
          leading: SvgPicture.asset(item['icon']),
          title: Text(
            item['label'],
            style: CustomTypography.poppinsSemiBold.copyWith(fontSize: 12.sp),
          ),
          trailing: item['isLogout'] == true
              ? null
              : Icon(Icons.arrow_forward_ios,
                  size: 12.sp, color: AppColorsTheme.textSecondary),
          onTap: () {
            if (item['isLogout'] == true) {
              // Handle sign out
            } else {
              // Navigate to respective screens
            }
          },
        );
      },
    );
  }
}
