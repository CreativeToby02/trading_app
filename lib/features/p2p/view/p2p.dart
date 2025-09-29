// lib/features/p2p/view/p2p.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trading_app/features/p2p/view/tradeview.dart';
import 'package:trading_app/res/assets.dart';
import 'package:trading_app/res/gap.dart';
import 'package:trading_app/res/render_assets.dart';
import 'package:trading_app/res/theme/theme_vm.dart';
import 'package:trading_app/utils/extensions/extensions.dart';

class P2pView extends StatefulWidget {
  const P2pView({super.key});

  @override
  State<P2pView> createState() => _P2pViewState();
}

class _P2pViewState extends State<P2pView> {
  int selectedIndex = 0;
  int selectedThemeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appColor = context.palette;
    final textStyle = context.typography;

    final themeViewModel = Provider.of<ThemeNotifier>(context);
    final isDark = themeViewModel.themeMode == ThemeMode.dark;

    return Scaffold(
      backgroundColor: appColor!.primary,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'P2P Trading',
                        style: textStyle!.displayMedium.copyWith(fontSize: 24),
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: appColor.secondary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          children: [
                            Tabar(
                              title: 'Light',
                              isActive: selectedThemeIndex == 0 ? true : false,
                              onTap: () {
                                setState(() {
                                  selectedThemeIndex = 0;
                                  themeViewModel.setTheme(ThemeMode.light);
                                });
                              },
                            ),
                            Tabar(
                              title: 'Dark',
                              isActive: selectedThemeIndex == 1 ? true : false,
                              onTap: () {
                                setState(() {
                                  selectedThemeIndex = 1;
                                  themeViewModel.setTheme(ThemeMode.dark);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpacing(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: appColor.secondary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          children: [
                            Tabar(
                              title: 'Buy',
                              isActive: selectedIndex == 0 ? true : false,
                              onTap: () {
                                setState(() {
                                  selectedIndex = 0;
                                });
                              },
                            ),
                            Tabar(
                              title: 'Sell',
                              isActive: selectedIndex == 1 ? true : false,
                              onTap: () {
                                setState(() {
                                  selectedIndex = 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ),

                      Row(
                        children: [
                          Text(
                            'Order History',
                            style: textStyle.bodyMedium.copyWith(
                              color: appColor.highlight,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: appColor.highlight,
                            size: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: appColor.secondary,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 2,
                    color: appColor.white.withAlpha(10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 8,
                children: [
                  Row(
                    spacing: 3,
                    children: [
                      CircleAvatar(radius: 10, backgroundColor: appColor.white),
                      Text(
                        'USDT',
                        style: textStyle.bodySmall.copyWith(
                          color: appColor.textPrimary,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down_rounded, size: 14),
                    ],
                  ),

                  Row(
                    spacing: 2,
                    children: [
                      Text(
                        'Limit',
                        style: textStyle.bodySmall.copyWith(
                          color: appColor.textPrimary,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down_rounded, size: 14),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Payment Methods',
                        style: textStyle.bodySmall.copyWith(
                          color: appColor.textPrimary,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down_rounded, size: 14),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                    colors: [
                      appColor.primary,
                      appColor.primary,
                      appColor.secondary.withAlpha(50),
                      appColor.secondary.withAlpha(80),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 8,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return TradingCard(
                        tradingType: selectedIndex == 0
                            ? TradingType.buy
                            : TradingType.sell,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return TradeView(
                                  tradingType: selectedIndex == 0
                                      ? TradingType.buy
                                      : TradingType.sell,
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum TradingType { buy, sell }

class TradingCard extends StatelessWidget {
  const TradingCard({super.key, required this.tradingType, this.onTap});

  final TradingType tradingType;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final appColor = context.palette;
    final textStyle = context.typography;
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: appColor!.primary,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: appColor.textPrimary.withAlpha(30)),
      ),
      child: Column(
        spacing: 10,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 3,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundImage: AssetImage(profileImage),
                      ),
                      Text('  TheCrypto_lord01', style: textStyle!.overline),
                    ],
                  ),
                  Text(
                    '100 Order(98%)',
                    style: textStyle.overline.copyWith(
                      color: appColor.textPrimary.withAlpha(100),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgIcon(
                    assetPath: clockIcon,
                    height: 12,
                    color: appColor.textPrimary,
                  ),
                  Text(' 10 min', style: textStyle.overline),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '₦5,000',
                    style: textStyle.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Quantity: ',
                      style: textStyle.overline.copyWith(
                        color: appColor.textPrimary.withAlpha(100),
                        fontSize: 10,
                      ),
                      children: [
                        TextSpan(
                          text: '200USDT',
                          style: textStyle.overline.copyWith(
                            color: appColor.textPrimary,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Limit: ',
                      style: textStyle.overline.copyWith(
                        color: appColor.textPrimary.withAlpha(100),
                        fontSize: 10,
                      ),
                      children: [
                        TextSpan(
                          text: '₦5,000 - ₦300,000',
                          style: textStyle.overline.copyWith(
                            color: appColor.textPrimary,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              color: appColor.accent,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            ' Palmpay',
                            style: textStyle.overline.copyWith(
                              color: appColor.textPrimary.withAlpha(100),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              color: appColor.accent,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            ' Opay',
                            style: textStyle.overline.copyWith(
                              color: appColor.textPrimary.withAlpha(100),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: onTap,
                child: Container(
                  width: 73,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: appColor.buttonColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      tradingType == TradingType.buy ? 'Buy' : 'Sell',
                      style: textStyle.bodyMedium.copyWith(
                        color: appColor.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Tabar extends StatelessWidget {
  const Tabar({
    super.key,
    this.isActive = false,
    required this.title,
    this.onTap,
  });

  final bool? isActive;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final appColor = context.palette;
    final textStyle = context.typography;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: isActive == true ? appColor!.white : null,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            title,
            style: textStyle!.bodySmall.copyWith(
              color: isActive == true ? appColor!.black : appColor!.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({
    super.key,
    this.isActive = false,
    required this.title,
    this.onTap,
  });

  final bool? isActive;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final appColor = context.palette;
    final textStyle = context.typography;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: isActive == true ? appColor!.white : null,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            title,
            style: textStyle!.bodySmall.copyWith(
              color: isActive == true ? appColor!.primary : appColor!.white,
            ),
          ),
        ),
      ),
    );
  }
}
