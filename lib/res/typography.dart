import 'package:flutter/material.dart';

@immutable
class AppTextStyle {
  // Display styles for large headings
  static final displayLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    // fontFamily: DStrings.primaryFont,
    // letterSpacing: -0.5,
  );

  static final displayMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    // fontFamily: DStrings.primaryFont,
    // letterSpacing: -0.5,
  );

  // Heading styles
  static final headingLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    // fontFamily: DStrings.primaryFont,
    // letterSpacing: -0.25,
  );

  static final headingMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    // fontFamily: DStrings.primaryFont,
    // letterSpacing: -0.25,
  );

  static final headingSmall = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    // fontFamily: DStrings.primaryFont,
    // letterSpacing: -0.25,
  );

  // Body text styles
  static final bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    // fontFamily: DStrings.primaryFont,
    // letterSpacing: 0.15,
  );

  static final bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    // fontFamily: DStrings.primaryFont,
    // letterSpacing: 0.25,
  );

  static final bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    // fontFamily: DStrings.primaryFont,
    // letterSpacing: 0.4,
  );

  // Label styles
  static final labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    // fontFamily: DStrings.primaryFont,
    // letterSpacing: 0.1,
  );

  static final labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    // fontFamily: DStrings.primaryFont,
    // letterSpacing: 0.5,
  );

  static final labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    // fontFamily: DStrings.primaryFont,
    // letterSpacing: 0.5,
  );

  // Special styles
  static final caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    // fontFamily: DStrings.primaryFont,
    // letterSpacing: 0.4,
  );

  static final overline = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    // fontFamily: DStrings.primaryFont,
    // letterSpacing: 1.5,
  );

  const AppTextStyle._(); // Private constructor to prevent instantiation
}
