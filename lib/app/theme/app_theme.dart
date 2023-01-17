import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../presentation/resource/media_query_data.dart';
import '../../presentation/resource/size_manager.dart';
import '../service_locator/service_locator.dart';
import '../util/app_prefs.dart';
import 'app_color.dart';
import 'app_style.dart';

enum ThemeEnum { system, light, dark }

class AppTheme {
  /// current os theme
  static final String osTheme = MQ.data.platformBrightness.name;

  /// current app theme
  static ThemeEnum currentTheme = ThemeEnum.system;

  static final String system = ThemeEnum.system.name;
  static final String light = ThemeEnum.light.name;
  static final String dark = ThemeEnum.dark.name;

  static ThemeData getAppTheme() {
    final String prefsTheme = sl<AppPrefs>().appTheme;

    if (prefsTheme == system) {
      currentTheme = ThemeEnum.system;
      return osTheme == light ? _lightTheme() : _darkTheme();
    }

    if (prefsTheme == dark) {
      currentTheme = ThemeEnum.dark;
      return _darkTheme();
    }

    currentTheme = ThemeEnum.light;
    return _lightTheme();
  }

  static ThemeData _lightTheme() {
    return _baseTheme().copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.whiteLight,
      canvasColor: AppColor.whiteLight,
      backgroundColor: AppColor.whiteLight,

      /// text
      textTheme: TextTheme(
        displaySmall: AppStyle.textBold(
          color: AppColor.black,
          size: AppSize.fontSmall,
        ),
        displayMedium: AppStyle.textBold(
          color: AppColor.black,
          size: AppSize.fontMedium,
        ),
        displayLarge: AppStyle.textBold(
          color: AppColor.black,
          size: AppSize.fontLarge,
        ),
        headlineSmall: AppStyle.textMedium(
          color: AppColor.black,
          size: AppSize.fontSmall,
        ),
        headlineMedium: AppStyle.textMedium(
          color: AppColor.black,
          size: AppSize.fontMedium,
        ),
        headlineLarge: AppStyle.textMedium(
          color: AppColor.black,
          size: AppSize.fontLarge,
        ),
        titleSmall: AppStyle.textRegular(
          color: AppColor.black,
          size: AppSize.fontSmall,
        ),
        titleMedium: AppStyle.textRegular(
          color: AppColor.black,
          size: AppSize.fontMedium,
        ),
        titleLarge: AppStyle.textRegular(
          color: AppColor.black,
          size: AppSize.fontLarge,
        ),
        bodySmall: AppStyle.textRegular(
          color: AppColor.black,
          size: AppSize.fontSmall,
        ),
        bodyMedium: AppStyle.textRegular(
          color: AppColor.black,
          size: AppSize.fontMedium,
        ),
        bodyLarge: AppStyle.textRegular(
          color: AppColor.black,
          size: AppSize.fontLarge,
        ),
        labelSmall: AppStyle.textRegular(
          color: AppColor.black,
          size: AppSize.fontSmall,
        ),
        labelMedium: AppStyle.textRegular(
          color: AppColor.black,
          size: AppSize.fontMedium,
        ),
        labelLarge: AppStyle.textRegular(
          color: AppColor.black,
          size: AppSize.fontLarge,
        ),
      ),

      /// app bar
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColor.whiteLight,
        elevation: AppSize.elevationZero,
        shadowColor: AppColor.whiteLight,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColor.primary,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(
          color: AppColor.blackLight,
          size: AppSize.iconExtraSmall,
        ),
        titleTextStyle: AppStyle.textMedium(
          color: AppColor.black,
          size: AppSize.fontExtraLarge,
        ),
      ),

      /// input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: false,
        iconColor: AppColor.blackLight,
        hintStyle: AppStyle.textRegular(color: AppColor.disabled),
        labelStyle: AppStyle.textMedium(color: AppColor.disabled),
        errorStyle: AppStyle.textRegular(color: AppColor.error),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.disabled,
            width: AppSize.borderWidthExtraSmall,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.radiusSmall),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.primary,
            width: AppSize.borderWidthExtraSmall,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.radiusSmall),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.error,
            width: AppSize.borderWidthExtraSmall,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.radiusSmall),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.error,
            width: AppSize.borderWidthExtraSmall,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.radiusSmall),
          ),
        ),
      ),

      /// elevated button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: AppStyle.textMedium(
            color: AppColor.black,
            size: AppSize.fontLarge,
          ),
          fixedSize: Size(AppSize.width5, AppSize.height0_06),
          foregroundColor: AppColor.black,
          backgroundColor: AppColor.primaryLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSize.radiusTripleExtraLarge,
            ),
          ),
        ),
      ),

      /// list tile
      listTileTheme: ListTileThemeData(
        dense: true,
        textColor: AppColor.black,
        selectedColor: AppColor.black,
        tileColor: AppColor.whiteLight,
        selectedTileColor: AppColor.primaryLight,
        horizontalTitleGap: AppSize.paddingWidthTripleExtraSmall,
        iconColor: AppColor.primary,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: AppColor.disabled,
            width: AppSize.borderWidthSmall,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.radiusSmall),
          ),
        ),
      ),

      /// card theme
      cardTheme: CardTheme(
        color: AppColor.white,
        elevation: AppSize.elevationSmall,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.radiusSmall),
        ),
      ),

      /// icon
      iconTheme: IconThemeData(
          color: AppColor.blackLight, size: AppSize.iconExtraSmall),

      /// bottom sheet
      bottomSheetTheme: BottomSheetThemeData(
        elevation: AppSize.elevationExtraSmall,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.radiusSmall),
        ),
      ),

      /// bottom navbar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: AppSize.elevationExtraSmall,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColor.disabled,
        selectedItemColor: AppColor.primaryLight,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  static ThemeData _darkTheme() {
    return _baseTheme().copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.blackLight,
      canvasColor: AppColor.blackLight,
      backgroundColor: AppColor.blackLight,

      /// text
      textTheme: TextTheme(
        displaySmall: AppStyle.textBold(
          color: AppColor.white,
          size: AppSize.fontSmall,
        ),
        displayMedium: AppStyle.textBold(
          color: AppColor.white,
          size: AppSize.fontMedium,
        ),
        displayLarge: AppStyle.textBold(
          color: AppColor.white,
          size: AppSize.fontLarge,
        ),
        headlineSmall: AppStyle.textMedium(
          color: AppColor.white,
          size: AppSize.fontSmall,
        ),
        headlineMedium: AppStyle.textMedium(
          color: AppColor.white,
          size: AppSize.fontMedium,
        ),
        headlineLarge: AppStyle.textMedium(
          color: AppColor.white,
          size: AppSize.fontLarge,
        ),
        titleSmall: AppStyle.textRegular(
          color: AppColor.white,
          size: AppSize.fontSmall,
        ),
        titleMedium: AppStyle.textRegular(
          color: AppColor.white,
          size: AppSize.fontMedium,
        ),
        titleLarge: AppStyle.textRegular(
          color: AppColor.white,
          size: AppSize.fontLarge,
        ),
        bodySmall: AppStyle.textRegular(
          color: AppColor.white,
          size: AppSize.fontSmall,
        ),
        bodyMedium: AppStyle.textRegular(
          color: AppColor.white,
          size: AppSize.fontMedium,
        ),
        bodyLarge: AppStyle.textRegular(
          color: AppColor.white,
          size: AppSize.fontLarge,
        ),
        labelSmall: AppStyle.textRegular(
          color: AppColor.white,
          size: AppSize.fontSmall,
        ),
        labelMedium: AppStyle.textRegular(
          color: AppColor.white,
          size: AppSize.fontMedium,
        ),
        labelLarge: AppStyle.textRegular(
          color: AppColor.white,
          size: AppSize.fontLarge,
        ),
      ),

      /// app bar
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColor.blackLight,
        elevation: AppSize.elevationZero,
        shadowColor: AppColor.whiteLight,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColor.primary,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(
          color: AppColor.whiteLight,
          size: AppSize.iconExtraSmall,
        ),
        titleTextStyle: AppStyle.textMedium(
          color: AppColor.white,
          size: AppSize.fontExtraLarge,
        ),
      ),

      /// input decoration theme (text field)
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: false,
        iconColor: AppColor.whiteLight,
        hintStyle: AppStyle.textRegular(color: AppColor.disabled),
        labelStyle: AppStyle.textMedium(color: AppColor.disabled),
        errorStyle: AppStyle.textRegular(color: AppColor.error),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.disabled,
            width: AppSize.borderWidthSmall,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.radiusSmall),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.primary,
            width: AppSize.borderWidthSmall,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.radiusSmall),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.error,
            width: AppSize.borderWidthSmall,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.radiusSmall),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.error,
            width: AppSize.borderWidthSmall,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppSize.radiusSmall,
            ),
          ),
        ),
      ),

      /// elevated button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: AppStyle.textMedium(
            color: AppColor.black,
            size: AppSize.fontLarge,
          ),
          foregroundColor: AppColor.black,
          backgroundColor: AppColor.primaryLight,
          fixedSize: Size(AppSize.width5, AppSize.height0_05),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSize.radiusTripleExtraLarge,
            ),
          ),
        ),
      ),

      /// list tile
      listTileTheme: ListTileThemeData(
        dense: true,
        selectedTileColor: AppColor.primaryLight,
        iconColor: AppColor.primary,
        horizontalTitleGap: AppSize.paddingWidthTripleExtraSmall,
        textColor: AppColor.white,
        selectedColor: AppColor.white,
        tileColor: AppColor.blackLight,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: AppColor.unselected,
            width: AppSize.borderWidthSmall,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.radiusSmall),
          ),
        ),
      ),

      /// card theme
      cardTheme: CardTheme(
        color: AppColor.greyDark,
        elevation: AppSize.elevationSmall,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.radiusSmall),
        ),
      ),

      /// icon
      iconTheme: IconThemeData(
        color: AppColor.whiteLight,
        size: AppSize.iconExtraSmall,
      ),

      /// bottom navbar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: AppColor.unselected,
        elevation: AppSize.elevationExtraSmall,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.primaryLight,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  static ThemeData _baseTheme() {
    return ThemeData(
      primaryColor: AppColor.primary,
      primarySwatch: AppColor.primary,
      primaryColorLight: AppColor.primaryLight,
      primaryColorDark: AppColor.primaryDark,
      disabledColor: AppColor.disabled,
      splashColor: AppColor.primaryLight,
      errorColor: AppColor.error,
      unselectedWidgetColor: AppColor.unselected,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
