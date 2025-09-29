// lib/features/dashboard/view/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:trading_app/features/p2p/view/p2p.dart';
import 'package:trading_app/res/assets.dart';
import 'package:trading_app/res/render_assets.dart';
import 'package:trading_app/utils/extensions/extensions.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    const P2pView(),
    const P2pView(),
    const P2pView(),
    const P2pView(),
  ];

  // DateTime? _lastBackPressedTime;

  @override
  Widget build(BuildContext context) {
    final appColor = context.palette;
    final textStyle = context.typography;
    return PopScope(
      // canPop: false,
      // onPopInvoked: (bool didPop) async {
      //   if (didPop) return;

      //   final now = DateTime.now();
      //   final bool backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
      //       _lastBackPressedTime == null ||
      //       now.difference(_lastBackPressedTime!) > const Duration(seconds: 2);

      //   if (_currentIndex != 0) {
      //     // If not on home tab, switch to home tab
      //     setState(() {
      //       _currentIndex = 0;
      //     });
      //   }
      // },
      child: Scaffold(
        body: _tabs[_currentIndex],
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xFF2991BB),
            unselectedLabelStyle: textStyle!.bodySmall.copyWith(
              color: appColor!.accent.withAlpha(50),
            ),
            unselectedItemColor: appColor.accent.withAlpha(100),
            selectedLabelStyle: textStyle.bodySmall,
            enableFeedback: false,
            backgroundColor: appColor.secondary,
            items: [
              BottomNavigationBarItem(
                icon: SvgIcon(assetPath: homeIcon).paddingOnly(bottom: 8),
                activeIcon: SvgIcon(
                  assetPath: activeHomeIcon,
                  color: Color(0xFF2991BB),
                ).paddingOnly(bottom: 8),
                label: 'Portfolio',
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(assetPath: convertIcon).paddingOnly(bottom: 8),
                activeIcon: SvgIcon(
                  assetPath: activeConvertIcon,
                  color: Color(0xFF2991BB),
                ).paddingOnly(bottom: 8),
                label: 'P2P Trading',
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(assetPath: chartIcon).paddingOnly(bottom: 8),
                activeIcon: SvgIcon(
                  assetPath: chartIcon,
                  color: Color(0xFF2991BB),
                ).paddingOnly(bottom: 8),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(assetPath: menuIcon).paddingOnly(bottom: 8),
                activeIcon: SvgIcon(
                  assetPath: menuIcon,
                  color: Color(0xFF2991BB),
                ).paddingOnly(bottom: 8),
                label: 'More',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
