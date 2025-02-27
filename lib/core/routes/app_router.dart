import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/app_bottom_bar.dart';
import '../../presentation/screens/auth/login_screen.dart';
import '../../presentation/screens/beranda/beranda_screen.dart';
import '../../presentation/screens/cart/cart.dart';
import '../../presentation/screens/category/category_screen.dart';
import '../../presentation/screens/detail_item/detail_item.dart';
import '../../presentation/screens/item/item_screen.dart';
import '../../presentation/screens/onboarding/onboarding_screen.dart';
import '../../presentation/screens/profile/profile_screen.dart';
import '../../presentation/screens/splash_screen.dart';
import '../../presentation/screens/wishlist/wishlist.dart';
import '../utils/store.dart';
import 'app_path.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppPath.splashScreen,
    routes: [
      GoRoute(
        path: AppPath.onboardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppPath.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppPath.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppPath.appBottomBar,
        builder: (context, state) => const AppBottomBar(),
      ),
      GoRoute(
        path: AppPath.berandaScreen,
        builder: (context, state) => const BerandaScreen(),
      ),
      GoRoute(
        path: AppPath.profileScreen,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: AppPath.detailItemScreen,
        builder: (context, state) {
          final product = state.extra as Product;
          return DetailItemScreen(product: product);
        },
      ),
      GoRoute(
        path: AppPath.categoriesScreen,
        builder: (context, state) => const CategoriesScreen(),
      ),
      GoRoute(
        path: AppPath.itemScreen,
        builder: (context, state) => const ItemScreen(),
      ),
      GoRoute(
        path: AppPath.cartScreen,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: AppPath.wishlistScreen,
        builder: (context, state) => const WishlistScreen(),
      ),
    ],
  );
});
