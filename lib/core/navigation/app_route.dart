import 'package:flutter/material.dart';

import '../../presentation/category/view/category_screen.dart';
import '../../presentation/deal/view/deal_screen.dart';
import '../../presentation/language/view/language_screen.dart';
import '../../presentation/login/view/login_screen.dart';
import '../../presentation/main/view/main_screen.dart';
import '../../presentation/not_found/view/not_found_screen.dart';
import '../../presentation/register/view/register_screen.dart';
import '../../presentation/splash/view/splash_screen.dart';
import '../../presentation/theme/view/theme_screen.dart';
import 'routes.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.routeSplash:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const SplashScreen()),
        );
      case Routes.routeMain:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const MainScreen()),
        );
      case Routes.routeLogin:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const LoginScreen()),
        );
      case Routes.routeRegister:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const RegisterScreen()),
        );
      case Routes.routeTheme:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const ThemeScreen()),
        );
      case Routes.routeLanguage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const LanguageScreen()),
        );
      case Routes.routeCategory:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => CategoryScreen()),
        );
      case Routes.routeProduct:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => DealScreen()),
        );
      case Routes.routeDeal:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => DealScreen()),
        );
      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const NotFoundScreen()),
        );
    }
  }
}
