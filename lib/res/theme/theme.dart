// lib/res/theme/app_theme.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:trading_app/res/colors.dart';
import 'package:trading_app/res/theme/t_extensions.dart';
import 'package:trading_app/res/typography.dart';

class AppTheme {
  // Light Theme
  static ThemeData get light {
    return ThemeData(
      primaryColor: AppColors.accentColor,
      primaryColorDark: AppColors.primaryColor,
      primaryColorLight: AppColors.accentColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
      brightness: Brightness.light,
      splashColor: AppColors.accentColor.withOpacity(0.3),
      extensions: <ThemeExtension>[
        DPalette(
          primary: Color(0xFFFFFFFF),
          secondary: Color(0xFFF8F8F8),
          buttonColor: AppColors.primaryColor,
          white: AppColors.whiteColor,
          accent: AppColors.accentColor,
          highlight: AppColors.highlightColor,
          black: AppColors.blackColor,
          textPrimary: AppColors.blackColor,
          secondaryButton: AppColors.primaryColor,
        ),
        DTypography(
          displayLarge: AppTextStyle.displayLarge,
          displayMedium: AppTextStyle.displayMedium,
          headingLarge: AppTextStyle.headingLarge,
          headingMedium: AppTextStyle.headingMedium,
          headingSmall: AppTextStyle.headingSmall,
          bodyLarge: AppTextStyle.bodyLarge,
          bodyMedium: AppTextStyle.bodyMedium,
          bodySmall: AppTextStyle.bodySmall,
          labelLarge: AppTextStyle.labelLarge,
          labelMedium: AppTextStyle.labelMedium,
          labelSmall: AppTextStyle.labelSmall,
          caption: AppTextStyle.caption,
          overline: AppTextStyle.overline,
        ),
      ],
    );
  }

  // Dark Theme
  static ThemeData get dark {
    return ThemeData(
      primaryColor: AppColors.accentColor,
      primaryColorDark: AppColors.primaryColor,
      primaryColorLight: AppColors.accentColor,
      scaffoldBackgroundColor: AppColors.secondaryColor,
      brightness: Brightness.dark,
      splashColor: AppColors.accentColor.withOpacity(0.3),
      extensions: <ThemeExtension>[
        DPalette(
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
          buttonColor: AppColors.whiteColor,
          white: AppColors.whiteColor,
          accent: AppColors.accentColor,
          highlight: AppColors.highlightColor,
          black: AppColors.blackColor,
          textPrimary: AppColors.whiteColor,
          secondaryButton: AppColors.accentColor,
        ),
        DTypography(
          displayLarge: AppTextStyle.displayLarge.copyWith(
            color: AppColors.whiteColor,
          ),
          displayMedium: AppTextStyle.displayMedium.copyWith(
            color: AppColors.whiteColor,
          ),
          headingLarge: AppTextStyle.headingLarge.copyWith(
            color: AppColors.whiteColor,
          ),
          headingMedium: AppTextStyle.headingMedium.copyWith(
            color: AppColors.whiteColor,
          ),
          headingSmall: AppTextStyle.headingSmall.copyWith(
            color: AppColors.whiteColor,
          ),
          bodyLarge: AppTextStyle.bodyLarge.copyWith(
            color: AppColors.whiteColor,
          ),
          bodyMedium: AppTextStyle.bodyMedium.copyWith(
            color: AppColors.whiteColor,
          ),
          bodySmall: AppTextStyle.bodySmall.copyWith(
            color: AppColors.whiteColor,
          ),
          labelLarge: AppTextStyle.labelLarge.copyWith(
            color: AppColors.whiteColor,
          ),
          labelMedium: AppTextStyle.labelMedium.copyWith(
            color: AppColors.whiteColor,
          ),
          labelSmall: AppTextStyle.labelSmall.copyWith(
            color: AppColors.whiteColor,
          ),
          caption: AppTextStyle.caption.copyWith(color: AppColors.whiteColor),
          overline: AppTextStyle.overline.copyWith(color: AppColors.whiteColor),
        ),
      ],
    );
  }
}
