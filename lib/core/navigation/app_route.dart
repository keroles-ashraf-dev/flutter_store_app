import 'package:flutter/material.dart';
import 'package:store/core/service_locator/service_locator.dart';
import 'package:store/presentation/account/view/account_screen.dart';
import 'package:store/presentation/cart/view/cart_screen.dart';
import 'package:store/presentation/home/view/home_screen.dart';
import 'package:store/presentation/logout/view/logout_screen.dart';
import 'package:store/presentation/product/view/product_screen.dart';

import '../../presentation/category/view/category_screen.dart';
import '../../presentation/deal/view/deal_screen.dart';
import '../../presentation/language/view/language_screen.dart';
import '../../presentation/login/view/login_screen.dart';
import '../../presentation/login_required/view/login_required_screen.dart';
import '../../presentation/main/view/main_screen.dart';
import '../../presentation/more/view/more_screen.dart';
import '../../presentation/not_found/view/not_found_screen.dart';
import '../../presentation/register/view/register_screen.dart';
import '../../presentation/splash/view/splash_screen.dart';
import '../../presentation/theme/view/theme_screen.dart';
import '../debug/function.dart';
import '../verification/verifier.dart';
import 'routes.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    /// verify if requested route require verifications like (login)
    /// if so then return new Route depends on required verifications
    routeSettings = Verifier.verify(routeSettings);
      log(routeSettings);
    switch (routeSettings.name) {
      case Routes.routeSplash:
        ServiceLocator.initSplashModule();
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const SplashScreen()),
        );
      case Routes.routeMain:
        ServiceLocator.initMainModule();
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const MainScreen()),
        );
      case Routes.routeHome:
        ServiceLocator.initHomeModule();
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const HomeScreen()),
        );
      case Routes.routeCategory:
        ServiceLocator.initCategoryModule();
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => CategoryScreen()),
        );
      case Routes.routeProduct:
        ServiceLocator.initCartModule();
        ServiceLocator.initProductModule();
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => ProductScreen()),
        );
      case Routes.routeDeal:
        ServiceLocator.initCartModule();
        ServiceLocator.initDealModule();
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => DealScreen()),
        );
      case Routes.routeAccount:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const AccountScreen()),
        );
      case Routes.routeLoginRequired:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const LoginRequiredScreen()),
        );
      case Routes.routeLogin:
        ServiceLocator.initLoginModule();
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const LoginScreen()),
        );
      case Routes.routeRegister:
        ServiceLocator.initRegisterModule();
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const RegisterScreen()),
        );
      case Routes.routeLogout:
        ServiceLocator.initLogoutModule();
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const LogoutScreen()),
        );
      case Routes.routeCart:
        ServiceLocator.initCartModule();
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const CartScreen()),
        );
      case Routes.routeMore:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const MoreScreen()),
        );
      case Routes.routeTheme:
        ServiceLocator.initThemeModule();
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const ThemeScreen()),
        );
      case Routes.routeLanguage:
        ServiceLocator.initLanguageModule();
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const LanguageScreen()),
        );
      case Routes.routeNotFound:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const NotFoundScreen()),
        );
      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: ((context) => const NotFoundScreen()),
        );
    }
  }
}
