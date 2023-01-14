import 'package:flutter/material.dart';
import 'package:store/presentation/category/view/category_screen.dart';
import 'package:store/presentation/deal/view/deal_screen.dart';
import 'package:store/presentation/login/view/login_screen.dart';
import 'package:store/presentation/main/view/main_screen.dart';
import 'package:store/presentation/not_found/view/not_found_screen.dart';
import 'package:store/presentation/register/view/register_screen.dart';
import 'package:store/presentation/splash/view/initial_screen.dart';
import 'package:store/presentation/theme/view/theme_screen.dart';

import '../../presentation/language/view/language_screen.dart';

class Routes {
  static const String routeInitial = '/';
  static const String routeMain = '/main';
  static const String routeCategory = '/main/categories/category';
  static const String routeProduct = '/main/categories/product';
  static const String routeDeal = '/main/deals/deal';
  static const String routeLogin = '/main/account/login';
  static const String routeRegister = '/main/account/register';
  static const String routeLogout = '/main/account/logout';
  static const String routeSupport = '/main/account/support';
  static const String routeTheme = '/main/more/theme';
  static const String routeLanguage = '/main/more/language';
  static const String routeAbout = '/main/more/about';
}

class AppRoutes {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.routeInitial:
        return MaterialPageRoute(
            settings: routeSettings, builder: ((context) => const InitialScreen()));
      case Routes.routeMain:
        return MaterialPageRoute(
            settings: routeSettings, builder: ((context) => const MainScreen()));
      case Routes.routeLogin:
        return MaterialPageRoute(
            settings: routeSettings, builder: ((context) => const LoginScreen()));
      case Routes.routeRegister:
        return MaterialPageRoute(
            settings: routeSettings, builder: ((context) => const RegisterScreen()));
      case Routes.routeTheme:
        return MaterialPageRoute(
            settings: routeSettings, builder: ((context) => const ThemeScreen()));
        case Routes.routeLanguage:
        return MaterialPageRoute(
            settings: routeSettings, builder: ((context) => const LanguageScreen()));
      case Routes.routeCategory:
        return MaterialPageRoute(
            settings: routeSettings, builder: ((context) => CategoryScreen()));
      case Routes.routeProduct:
        return MaterialPageRoute(
            settings: routeSettings, builder: ((context) => DealScreen()));
        case Routes.routeDeal:
        return MaterialPageRoute(
            settings: routeSettings, builder: ((context) => DealScreen()));
      default:
        return MaterialPageRoute(
            settings: routeSettings, builder: ((context) => const NotFoundScreen()));
    }
  }
}
