import 'package:flutter/material.dart';

@immutable
class DTypography extends ThemeExtension<DTypography> {
  // Display styles
  final TextStyle displayLarge;
  final TextStyle displayMedium;

  // Heading styles
  final TextStyle headingLarge;
  final TextStyle headingMedium;
  final TextStyle headingSmall;

  // Body styles
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;

  // Label styles
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;

  // Special styles
  final TextStyle caption;
  final TextStyle overline;

  const DTypography({
    required this.displayLarge,
    required this.displayMedium,
    required this.headingLarge,
    required this.headingMedium,
    required this.headingSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    required this.caption,
    required this.overline,
  });

  @override
  DTypography copyWith({
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? headingLarge,
    TextStyle? headingMedium,
    TextStyle? headingSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    TextStyle? caption,
    TextStyle? overline,
  }) {
    return DTypography(
      displayLarge: displayLarge ?? this.displayLarge,
      displayMedium: displayMedium ?? this.displayMedium,
      headingLarge: headingLarge ?? this.headingLarge,
      headingMedium: headingMedium ?? this.headingMedium,
      headingSmall: headingSmall ?? this.headingSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelLarge: labelLarge ?? this.labelLarge,
      labelMedium: labelMedium ?? this.labelMedium,
      labelSmall: labelSmall ?? this.labelSmall,
      caption: caption ?? this.caption,
      overline: overline ?? this.overline,
    );
  }

  @override
  DTypography lerp(ThemeExtension<DTypography>? other, double t) {
    if (other is! DTypography) return this;
    return this;
  }
}

@immutable
class DPalette extends ThemeExtension<DPalette> {
  const DPalette({
    required this.primary,
    required this.secondary,
    required this.white,
    required this.accent,
    required this.highlight,
    required this.black,
    required this.textPrimary,
    required this.buttonColor,
    required this.secondaryButton,
  });

  final Color primary;
  final Color secondary;
  final Color white;
  final Color accent;
  final Color highlight;
  final Color black;
  final Color textPrimary;
  final Color buttonColor;
  final Color secondaryButton;

  @override
  DPalette copyWith({
    Color? primary,
    Color? secondary,
    Color? white,
    Color? accent,
    Color? highlight,
    Color? black,
    Color? textPrimary,
    Color? buttonColor,
    Color? secondaryButton,
  }) {
    return DPalette(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      white: white ?? this.white,
      accent: accent ?? this.accent,
      highlight: highlight ?? this.highlight,
      black: black ?? this.black,
      textPrimary: textPrimary ?? this.textPrimary,
      buttonColor: buttonColor ?? this.buttonColor,
      secondaryButton: secondaryButton ?? this.secondaryButton,
    );
  }

  @override
  DPalette lerp(ThemeExtension<DPalette>? other, double t) {
    if (other is! DPalette) {
      return this;
    }
    return DPalette(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      white: Color.lerp(white, other.white, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      highlight: Color.lerp(highlight, other.highlight, t)!,
      black: Color.lerp(black, other.black, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      buttonColor: Color.lerp(buttonColor, other.buttonColor, t)!,
      secondaryButton: Color.lerp(secondaryButton, other.secondaryButton, t)!,
    );
  }

  // Optional: Helper method to get the palette from context
  static DPalette of(BuildContext context) {
    return Theme.of(context).extension<DPalette>()!;
  }
}
