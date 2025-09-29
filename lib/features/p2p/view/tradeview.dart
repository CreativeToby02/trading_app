// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:trading_app/features/p2p/view/p2p.dart';
import 'package:trading_app/res/assets.dart';
import 'package:trading_app/res/gap.dart';
import 'package:trading_app/utils/extensions/extensions.dart';

class TradeView extends StatefulWidget {
  const TradeView({super.key, required this.tradingType});

  final TradingType tradingType;

  @override
  State<TradeView> createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appColor = context.palette;
    final textStyle = context.typography;
    return Scaffold(
      backgroundColor: appColor!.primary, // Dark background color
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Buy USDT Title
              Row(
                spacing: 15,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: appColor.textPrimary,
                    ),
                  ),
                  Text(
                    widget.tradingType == TradingType.buy
                        ? 'Buy USDT'
                        : 'Sell USDT',
                    style: textStyle!.displayMedium.copyWith(fontSize: 24),
                  ),
                ],
              ),
              addVerticalSpacing(20),

              // User Info Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: appColor.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  spacing: 8,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(profileImage),
                    ),
                    Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TheCrypto_Jord01',
                          style: textStyle.bodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: '100 Order ',
                            style: textStyle.overline.copyWith(
                              color: appColor.textPrimary.withAlpha(100),
                              fontSize: 10,
                            ),
                            children: [
                              TextSpan(
                                text: '(98% Completion Rate)',
                                style: textStyle.overline.copyWith(
                                  color: appColor.accent,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              addVerticalSpacing(20),

              // Crypto/Fiat Tabs
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: appColor.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          spacing: 15,
                          children: [
                            TradeTab(
                              title: 'Crypto',
                              isActive: selectedIndex == 0 ? true : false,
                              onTap: () {
                                setState(() {
                                  selectedIndex = 0;
                                });
                              },
                            ),
                            TradeTab(
                              title: 'Fiat',
                              isActive: selectedIndex == 1 ? true : false,
                              onTap: () {
                                setState(() {
                                  selectedIndex = 1;
                                });
                              },
                            ),
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Price: ',
                            style: textStyle.overline.copyWith(
                              color: appColor.textPrimary.withAlpha(100),
                              fontSize: 10,
                            ),
                            children: [
                              TextSpan(
                                text: '₦5,000',
                                style: textStyle.overline.copyWith(
                                  color: appColor.textPrimary,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // Price Section
                    TextField(
                      style: TextStyle(
                        color: appColor.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Min.5000',
                        labelStyle: TextStyle(
                          color: appColor.textPrimary.withOpacity(0.7),
                          fontSize: 12,
                        ),
                        suffix: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'USDT',
                                style: TextStyle(
                                  color: appColor.textPrimary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(
                                text: ' Max',
                                style: textStyle.overline.copyWith(
                                  color: appColor.accent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFF2991BB),
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: appColor.textPrimary.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFF2991BB),
                            width: 1.5,
                          ),
                        ),
                        filled: true,
                        fillColor: appColor.primary,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      cursorColor: const Color(0xFF2991BB),
                    ),
                    addVerticalSpacing(10),

                    // Limit Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 4,
                          children: [
                            Text(
                              'Limit:',
                              style: textStyle.overline.copyWith(
                                color: appColor.textPrimary,
                                fontSize: 10,
                              ),
                            ),

                            Text(
                              '30USDT - 1,000USDT',
                              style: textStyle.overline.copyWith(
                                color: appColor.textPrimary,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Available Balance:',
                              style: textStyle.overline.copyWith(
                                color: appColor.textPrimary,
                                fontSize: 10,
                              ),
                            ),

                            Text(
                              '1,000USDT',
                              style: textStyle.overline.copyWith(
                                color: appColor.textPrimary,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Payment Method Section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: appColor.accent.withAlpha(80),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Payment Method',
                            style: textStyle.overline.copyWith(
                              color: appColor.textPrimary,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            'Bank Transfer',
                            style: textStyle.overline.copyWith(
                              color: appColor.accent,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    addVerticalSpacing(20),

                    // Buy Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appColor.secondaryButton,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          widget.tradingType == TradingType.buy
                              ? 'Buy'
                              : 'Sell',
                          style: TextStyle(
                            color: appColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              addVerticalSpacing(20),

              // Notes Section
              Text(
                'Notes',
                style: textStyle.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              addVerticalSpacing(12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '•',
                    style: TextStyle(
                      color: appColor.textPrimary.withOpacity(0.7),
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      ' To protect your assets, do not modify your registration link or conduct private transactions with merchants outside of the Help2Pay platform.',
                      style: TextStyle(
                        color: appColor.textPrimary.withOpacity(0.7),
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpacing(12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '•',
                    style: TextStyle(
                      color: appColor.textPrimary.withOpacity(0.7),
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      ' During the transfer process, do not include any information related to BTC, USDT, Help2Pay, or similar details in the remarks.',
                      style: TextStyle(
                        color: appColor.textPrimary.withOpacity(0.7),
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TradeTab extends StatelessWidget {
  const TradeTab({super.key, required this.title, this.isActive, this.onTap});

  final String title;
  final bool? isActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final appColor = context.palette;
    final textStyle = context.typography;
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 4,
          children: [
            Text(
              title,
              style: textStyle!.bodyMedium.copyWith(
                color: isActive == true
                    ? appColor!.accent
                    : appColor!.textPrimary,
              ),
            ),
            isActive == true
                ? Container(
                    height: 2,
                    width: 40,
                    decoration: BoxDecoration(
                      color: appColor.accent,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
