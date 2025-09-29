import 'package:flutter/material.dart';
import 'package:trading_app/res/theme/t_extensions.dart';

extension AppTheme on BuildContext {
  ThemeData get appTheme => Theme.of(this);
  DPalette? get palette => Theme.of(this).extension<DPalette>();
  DTypography? get typography => Theme.of(this).extension<DTypography>();
  Size get appScreenSize => MediaQuery.of(this).size;
  TextTheme get appTextTheme => appTheme.textTheme;

  push(Widget routeWidget) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => routeWidget));
  }

  pushR(Widget routeWidget) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => routeWidget),
      (pre) => false,
    );
  }
}

extension PaddingExtension on Widget {
  Widget paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Widget paddingAll(double value) {
    return Padding(padding: EdgeInsets.all(value), child: this);
  }

  Widget paddingOnly({
    double right = 0.0,
    double left = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      ),
      child: this,
    );
  }
}

//
extension MarginExtension on Widget {
  Widget marginSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Widget marginOnly({
    double right = 0.0,
    double left = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) {
    return Container(
      margin: EdgeInsets.only(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      ),
      child: this,
    );
  }

  Widget marginAll(double value) {
    return Container(margin: EdgeInsets.all(value), child: this);
  }
}

//center extension
extension CenterExtension on Widget {
  Widget get center {
    return Center(child: this);
  }
}
