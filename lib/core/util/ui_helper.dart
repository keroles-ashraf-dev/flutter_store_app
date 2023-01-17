import 'package:flutter/material.dart';
import '../i18n/app_localization.dart';

class UIHelper {
  /// helping to set margin start and end
  static EdgeInsets marginSTEB({double start = 0.0, double top = 0.0, double end = 0.0, double bottom = 0.0}){
    return EdgeInsets.only(
      right: AppLocalization.isRtl ? start : end,
      left: AppLocalization.isRtl ? end : start,
      top: top,
      bottom: bottom,
    );
  }

  /// helping to set margin start and end
  static EdgeInsets paddingSTEB({double start = 0.0, double top = 0.0, double end = 0.0, double bottom = 0.0}){
    return EdgeInsets.only(
      right: AppLocalization.isRtl ? start : end,
      left: AppLocalization.isRtl ? end : start,
      top: top,
      bottom: bottom,
    );
  }

  /// helping to set alignment center start
  static Alignment alienCenterStart(){
    return  AppLocalization.isRtl ? Alignment.centerRight : Alignment.centerLeft;
  }

  /// helping to set alignment center start
  static Alignment alienCenterEnd(){
    return  AppLocalization.isRtl ? Alignment.centerLeft : Alignment.centerRight;
  }
}
