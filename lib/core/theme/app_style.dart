import 'package:flutter/material.dart';

import '../util/font_manager.dart';
import '../util/size_manager.dart';

class AppStyle {
  static TextStyle _baseText(double size, FontWeight weight, Color? color) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: weight,
    );
  }

  /// text light style
  static TextStyle textLight({double size = AppSize.fontMedium, Color? color}) {
    return _baseText(size, FontWeightManager.light, color);
  }

  /// text regular style
  static TextStyle textRegular({double size = AppSize.fontMedium, Color? color}) {
    return _baseText(size, FontWeightManager.regular, color);
  }

  /// text medium style
  static TextStyle textMedium({double size = AppSize.fontMedium, Color? color}) {
    return _baseText(size, FontWeightManager.medium, color);
  }

  /// text bold style
  static TextStyle textBold({double size = AppSize.fontMedium, Color? color}) {
    return _baseText(size, FontWeightManager.bold, color);
  }
}
