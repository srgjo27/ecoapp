import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/ic_string.dart';
import '../../../core/constants/img_string.dart';
import '../../../core/routes/app_path.dart';
import '../../../shared/colors.dart';
import '../../../shared/typography.dart';
import 'widget/custom_button.dart';
import 'widget/custom_switch.dart';
import 'widget/input_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool rememberMe = false;

  // TODO: Implement login logic to connect UI with backend authentication.
  // This should call the auth provider/usecase and handle the result.
  void _login() async {
    // TODO: Call login usecase/provider here
    context.go(AppPath.appBottomBar);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColorsTheme.secondary,
          ),
        ),
        _backgroundImage(),
        _actionBar(context),
        _loginForm(),
      ],
    );
  }

  Widget _actionBar(BuildContext context) {
    return Positioned(
      top: 16.h,
      left: 4.w,
      right: 4.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              Icons.arrow_back,
              color: AppColorsTheme.background,
            ),
          ),
          Text(
            'Welcome',
            style: CustomTypography.poppinsMedium.copyWith(
              fontSize: 16.sp,
              color: AppColorsTheme.background,
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              Icons.settings,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _backgroundImage() {
    return SizedBox(
      width: double.infinity,
      height: 525.h,
      child: Image.asset(
        ImgString.illustrationLogin,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _loginForm() {
    return Positioned(
      left: 0.w,
      right: 0.w,
      bottom: 0.h,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 42.h, left: 16.w, right: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
          color: AppColorsTheme.secondary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back !',
              style: CustomTypography.poppinsSemiBold.copyWith(fontSize: 20.sp),
            ),
            SizedBox(height: 4.h),
            Text(
              'Sign in to your account',
              style: CustomTypography.poppinsRegular.copyWith(
                fontSize: 12.sp,
                color: AppColorsTheme.hintText,
              ),
            ),
            SizedBox(height: 16.h),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomInputField(
                    hintText: 'Email Address',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    icon: IcString.email,
                  ),
                  SizedBox(height: 4.h),
                  CustomInputField(
                    hintText: 'Password',
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    icon: IcString.lock,
                    obscureText: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Transform.scale(
                      scale: 0.6,
                      child: CustomSwitch(
                        value: rememberMe,
                        onChanged: (bool value) {
                          setState(() {
                            rememberMe = value;
                          });
                        },
                      ),
                    ),
                    Text(
                      'Remember Me',
                      style: CustomTypography.poppinsMedium.copyWith(
                        fontSize: 12.sp,
                        color: AppColorsTheme.hintText,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => {},
                  child: Text(
                    'Forgot Password ?',
                    style: CustomTypography.poppinsMedium.copyWith(
                      fontSize: 12.sp,
                      color: AppColorsTheme.link,
                    ),
                  ),
                ),
              ],
            ),
            CustomButton(
              onPressed: _login,
              title: 'Login',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account ?',
                  style: CustomTypography.poppinsMedium.copyWith(
                    fontSize: 12.sp,
                    color: AppColorsTheme.hintText,
                  ),
                ),
                TextButton(
                  onPressed: () => {},
                  child: Text(
                    'Sign Up',
                    style: CustomTypography.poppinsMedium.copyWith(
                      fontSize: 12.sp,
                      color: AppColorsTheme.text,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
