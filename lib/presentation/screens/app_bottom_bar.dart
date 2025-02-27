import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/colors.dart';
import '../providers/app_bottom_bar_provider.dart';
import 'beranda/beranda_screen.dart';
import 'profile/profile_screen.dart';

class AppBottomBar extends ConsumerStatefulWidget {
  const AppBottomBar({super.key});

  @override
  ConsumerState<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends ConsumerState<AppBottomBar> {
  static final List<Widget> _widgetOptions = <Widget>[
    const BerandaScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var navIndex = ref.watch(navProvider);

    return Scaffold(
      body: _widgetOptions[navIndex.index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex.index,
        onTap: (value) {
          ref.read(navProvider.notifier).onChangeIndex(value);
        },
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColorsTheme.primaryDark,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColorsTheme.secondary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
