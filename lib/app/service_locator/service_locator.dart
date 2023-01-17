import 'package:get_it/get_it.dart';
import 'package:store/data/datasource/remote/user_remote_datasource.dart';
import 'package:store/domain/repository/base_user_repository.dart';
import 'package:store/domain/usecase/address/get_address_usecase.dart';
import 'package:store/domain/usecase/auth/login_usecase.dart';
import 'package:store/domain/usecase/auth/register_usecase.dart';
import 'package:store/domain/usecase/category/get_main_categories_usecase.dart';
import 'package:store/domain/usecase/product/get_category_products_usecase.dart';
import 'package:store/domain/usecase/user/get_user_data_usecase.dart';
import 'package:store/presentation/cart/controller/cart_screen_bloc.dart';
import 'package:store/presentation/category/controller/category_screen_bloc.dart';
import 'package:store/presentation/home/controller/home_screen_bloc.dart';
import 'package:store/presentation/login/controller/login_screen_bloc.dart';
import 'package:store/presentation/register/controller/register_screen_bloc.dart';
import 'package:store/presentation/splash/controller/splash_screen_bloc.dart';
import 'package:store/presentation/theme/controller/theme_screen_bloc.dart';

import '../../data/cache/cache_manager.dart';
import '../../data/datasource/local/address_local_datasource.dart';
import '../../data/datasource/local/carousel_local_datasource.dart';
import '../../data/datasource/local/category_local_datasource.dart';
import '../../data/datasource/local/deal_local_datasource.dart';
import '../../data/datasource/local/product_local_datasource.dart';
import '../../data/datasource/remote/address_remote_datasource.dart';
import '../../data/datasource/remote/auth_remote_datasource.dart';
import '../../data/datasource/remote/carousel_remote_datasource.dart';
import '../../data/datasource/remote/cart_remote_datasource.dart';
import '../../data/datasource/remote/category_remote_datasource.dart';
import '../../data/datasource/remote/deal_remote_datasource.dart';
import '../../data/datasource/remote/product_remote_datasource.dart';
import '../../data/network/api_manager.dart';
import '../../data/network/network_info.dart';
import '../../data/repository/address_repository_impl.dart';
import '../../data/repository/auth_repository_impl.dart';
import '../../data/repository/carousel_repository_impl.dart';
import '../../data/repository/cart_repository_impl.dart';
import '../../data/repository/category_repository_impl.dart';
import '../../data/repository/deal_repository_impl.dart';
import '../../data/repository/product_repository_impl.dart';
import '../../data/repository/user_repository_impl.dart';
import '../../domain/repository/base_address_repository.dart';
import '../../domain/repository/base_auth_repository.dart';
import '../../domain/repository/base_carousel_repository.dart';
import '../../domain/repository/base_cart_repository.dart';
import '../../domain/repository/base_category_repository.dart';
import '../../domain/repository/base_deal_repository.dart';
import '../../domain/repository/base_product_repository.dart';
import '../../domain/usecase/carousel/get_main_carousel_usecase.dart';
import '../../domain/usecase/cart/get_cart_usecase.dart';
import '../../domain/usecase/deal/get_deal_usecase.dart';
import '../../domain/usecase/deal/get_deals_usecase.dart';
import '../../presentation/deal/controller/deal_screen_bloc.dart';
import '../../presentation/language/controller/language_screen_bloc.dart';
import '../../presentation/main/controller/main_screen_bloc.dart';
import '../error/error_handling.dart';
import '../session/session.dart';
import '../util/app_prefs.dart';
import '../validation/validator.dart';

/// app module call method
final sl = ServiceLocator.call();

/// callable, singleton class
class ServiceLocator {
  static final GetIt _sl = GetIt.instance;

  /// return instance of passed type from container
  static GetIt call<T extends Object>() {
    return _sl;
  }

  /// check if passed type is registered
  static bool isRegistered<T extends Object>() {
    try {
      _sl<T>();
      return true;
    } catch (_) {
      return false;
    }
  }

  /// initiate app module
  static void initAppModule() {
    _sl.registerLazySingleton<AppPrefs>(() => AppPrefs());
    _sl.registerLazySingleton<Session>(() => Session(_sl<AppPrefs>()));
    _sl.registerLazySingleton<Validator>(() => Validator());
    _sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo());
    _sl.registerLazySingleton<ErrorHandler>(() => ErrorHandler());
    _sl.registerLazySingleton<CacheManager>(() => CacheManager());
    _sl.registerLazySingleton<ApiManager>(
        () => ApiManager(_sl<AppPrefs>(), _sl<ErrorHandler>()));
  }

  /// initiate splash module
  static void initSplashModule() {
    /// bloc
    if (!isRegistered<SplashScreenBloc>()) {
      _sl.registerFactory<SplashScreenBloc>(
          () => SplashScreenBloc(_sl<Session>(), _sl<GetUserDataUsecase>()));
    }

    /// usecase
    if (!isRegistered<GetUserDataUsecase>()) {
      _sl.registerLazySingleton<GetUserDataUsecase>(
          () => GetUserDataUsecase(_sl<BaseUserRepository>()));
    }

    /// repository
    if (!isRegistered<BaseUserRepository>()) {
      _sl.registerLazySingleton<BaseUserRepository>(
        () => UserRepositoryImpl(
          _sl<ErrorHandler>(),
          _sl<NetworkInfo>(),
          _sl<BaseUserRemoteDatasource>(),
        ),
      );
    }

    /// remote datasource
    if (!isRegistered<BaseUserRemoteDatasource>()) {
      _sl.registerLazySingleton<BaseUserRemoteDatasource>(
          () => UserRemoteDatasourceImpl(_sl<ApiManager>()));
    }
  }

  /// initiate main module
  static void initMainModule() {
    /// bloc
    if (!isRegistered<MainScreenBloc>()) {
      _sl.registerFactory<MainScreenBloc>(
          () => MainScreenBloc(_sl<GetAddressUsecase>()));
    }

    /// usecase
    if (!isRegistered<GetAddressUsecase>()) {
      _sl.registerLazySingleton<GetAddressUsecase>(
          () => GetAddressUsecase(_sl<BaseAddressRepository>()));
    }

    /// repository
    if (!isRegistered<BaseAddressRepository>()) {
      _sl.registerLazySingleton<BaseAddressRepository>(
        () => AddressRepositoryImpl(
          _sl<ErrorHandler>(),
          _sl<NetworkInfo>(),
          _sl<BaseAddressLocalDatasource>(),
          _sl<BaseAddressRemoteDatasource>(),
        ),
      );
    }

    /// local datasource
    if (!isRegistered<BaseAddressLocalDatasource>()) {
      _sl.registerLazySingleton<BaseAddressLocalDatasource>(() =>
          AddressLocalDatasourceImpl(_sl<ErrorHandler>(), _sl<CacheManager>()));
    }

    /// remote datasource
    if (!isRegistered<BaseAddressRemoteDatasource>()) {
      _sl.registerLazySingleton<BaseAddressRemoteDatasource>(
          () => AddressRemoteDatasourceImpl(_sl<ApiManager>()));
    }
  }

  /// initiate home module
  static void initHomeModule() {
    /// bloc
    if (!isRegistered<HomeScreenBloc>()) {
      _sl.registerFactory<HomeScreenBloc>(
        () => HomeScreenBloc(
          _sl<GetMainCarouselUsecase>(),
          _sl<GetMainCategoriesUsecase>(),
          _sl<GetDealsUsecase>(),
        ),
      );
    }

    /// usecase
    if (!isRegistered<GetMainCarouselUsecase>()) {
      _sl.registerLazySingleton<GetMainCarouselUsecase>(
          () => GetMainCarouselUsecase(_sl<BaseCarouselRepository>()));
    }
    if (!isRegistered<GetMainCategoriesUsecase>()) {
      _sl.registerLazySingleton<GetMainCategoriesUsecase>(
          () => GetMainCategoriesUsecase(_sl<BaseCategoryRepository>()));
    }
    if (!isRegistered<GetDealsUsecase>()) {
      _sl.registerLazySingleton<GetDealsUsecase>(
          () => GetDealsUsecase(_sl<BaseDealRepository>()));
    }

    /// repository
    if (!isRegistered<BaseCarouselRepository>()) {
      _sl.registerLazySingleton<BaseCarouselRepository>(
        () => CarouselRepositoryImpl(
          _sl<ErrorHandler>(),
          _sl<NetworkInfo>(),
          _sl<BaseCarouselLocalDatasource>(),
          _sl<BaseCarouselRemoteDatasource>(),
        ),
      );
    }
    if (!isRegistered<BaseCategoryRepository>()) {
      _sl.registerLazySingleton<BaseCategoryRepository>(
        () => CategoryRepositoryImpl(
          _sl<ErrorHandler>(),
          _sl<NetworkInfo>(),
          _sl<BaseCategoryLocalDatasource>(),
          _sl<BaseCategoryRemoteDatasource>(),
        ),
      );
    }

    if (!isRegistered<BaseDealRepository>()) {
      _sl.registerLazySingleton<BaseDealRepository>(
        () => DealRepositoryImpl(
          _sl<ErrorHandler>(),
          _sl<NetworkInfo>(),
          _sl<BaseDealLocalDatasource>(),
          _sl<BaseDealRemoteDatasource>(),
        ),
      );
    }

    /// local datasource
    if (!isRegistered<BaseCarouselLocalDatasource>()) {
      _sl.registerLazySingleton<BaseCarouselLocalDatasource>(
        () => CarouselLocalDatasourceImpl(
          _sl<ErrorHandler>(),
          _sl<CacheManager>(),
        ),
      );
    }

    if (!isRegistered<BaseCategoryLocalDatasource>()) {
      _sl.registerLazySingleton<BaseCategoryLocalDatasource>(
        () => CategoryLocalDatasourceImpl(
          _sl<ErrorHandler>(),
          _sl<CacheManager>(),
        ),
      );
    }

    if (!isRegistered<BaseDealLocalDatasource>()) {
      _sl.registerLazySingleton<BaseDealLocalDatasource>(
        () => DealLocalDatasourceImpl(
          _sl<ErrorHandler>(),
          _sl<CacheManager>(),
        ),
      );
    }

    /// remote datasource
    if (!isRegistered<BaseCarouselRemoteDatasource>()) {
      _sl.registerLazySingleton<BaseCarouselRemoteDatasource>(
          () => CarouselRemoteDatasourceImpl(_sl<ApiManager>()));
    }
    if (!isRegistered<BaseCategoryRemoteDatasource>()) {
      _sl.registerLazySingleton<BaseCategoryRemoteDatasource>(
          () => CategoryRemoteDatasourceImpl(_sl<ApiManager>()));
    }
    if (!isRegistered<BaseDealRemoteDatasource>()) {
      _sl.registerLazySingleton<BaseDealRemoteDatasource>(
          () => DealRemoteDatasourceImpl(_sl<ApiManager>()));
    }
  }

  /// initiate category module
  static void initCategoryModule() {
    /// bloc
    if (!isRegistered<CategoryScreenBloc>()) {
      _sl.registerFactory<CategoryScreenBloc>(
          () => CategoryScreenBloc(_sl<GetCategoryProductsUsecase>()));
    }

    /// usecase
    if (!isRegistered<GetCategoryProductsUsecase>()) {
      _sl.registerLazySingleton<GetCategoryProductsUsecase>(
          () => GetCategoryProductsUsecase(_sl<BaseProductRepository>()));
    }

    /// repository
    if (!isRegistered<BaseProductRepository>()) {
      _sl.registerLazySingleton<BaseProductRepository>(
        () => ProductRepositoryImpl(
          _sl<ErrorHandler>(),
          _sl<NetworkInfo>(),
          _sl<BaseProductLocalDatasource>(),
          _sl<BaseProductRemoteDatasource>(),
        ),
      );
    }

    /// local datasource
    if (!isRegistered<BaseProductLocalDatasource>()) {
      _sl.registerLazySingleton<BaseProductLocalDatasource>(
        () => ProductLocalDatasourceImpl(
          _sl<ErrorHandler>(),
          _sl<CacheManager>(),
        ),
      );
    }

    /// remote datasource
    if (!isRegistered<BaseProductRemoteDatasource>()) {
      _sl.registerLazySingleton<BaseProductRemoteDatasource>(
          () => ProductRemoteDatasourceImpl(_sl<ApiManager>()));
    }
  }

  /// initiate deal module
  static void initDealModule() {
    /// bloc
    if (!isRegistered<DealScreenBloc>()) {
      _sl.registerFactory<DealScreenBloc>(
          () => DealScreenBloc(_sl<GetDealUsecase>()));
    }

    /// usecase
    if (!isRegistered<GetDealUsecase>()) {
      _sl.registerLazySingleton<GetDealUsecase>(
          () => GetDealUsecase(_sl<BaseDealRepository>()));
    }

    /// repository
    if (!isRegistered<BaseDealRepository>()) {
      _sl.registerLazySingleton<BaseDealRepository>(() => DealRepositoryImpl(
          _sl<ErrorHandler>(),
          _sl<NetworkInfo>(),
          _sl<BaseDealLocalDatasource>(),
          _sl<BaseDealRemoteDatasource>()));
    }

    /// local datasource
    if (!isRegistered<BaseDealLocalDatasource>()) {
      _sl.registerLazySingleton<BaseDealLocalDatasource>(
        () => DealLocalDatasourceImpl(
          _sl<ErrorHandler>(),
          _sl<CacheManager>(),
        ),
      );
    }

    /// remote datasource
    if (!isRegistered<BaseDealRemoteDatasource>()) {
      _sl.registerLazySingleton<BaseDealRemoteDatasource>(
          () => DealRemoteDatasourceImpl(_sl<ApiManager>()));
    }
  }

  /// initiate cart module
  static void initCartModule() {
    /// bloc
    if (!isRegistered<CartScreenBloc>()) {
      _sl.registerFactory<CartScreenBloc>(
        () => CartScreenBloc(_sl<GetCartUsecase>()),
      );
    }

    /// usecase
    if (!isRegistered<GetCartUsecase>()) {
      _sl.registerLazySingleton<GetCartUsecase>(
          () => GetCartUsecase(_sl<BaseCartRepository>()));
    }

    /// repository
    if (!isRegistered<BaseCartRepository>()) {
      _sl.registerLazySingleton<BaseCartRepository>(
        () => CartRepositoryImpl(
          _sl<ErrorHandler>(),
          _sl<NetworkInfo>(),
          _sl<BaseCartRemoteDatasource>(),
        ),
      );
    }

    /// remote datasource
    if (!isRegistered<BaseCartRemoteDatasource>()) {
      _sl.registerLazySingleton<BaseCartRemoteDatasource>(
          () => CartRemoteDatasourceImpl(_sl<ApiManager>()));
    }
  }

  /// initiate login module
  static void initLoginModule() {
    /// bloc
    if (!isRegistered<LoginScreenBloc>()) {
      _sl.registerFactory<LoginScreenBloc>(
        () => LoginScreenBloc(
          _sl<Session>(),
          _sl<Validator>(),
          _sl<LoginUsecase>(),
        ),
      );
    }

    /// usecase
    if (!isRegistered<LoginUsecase>()) {
      _sl.registerLazySingleton<LoginUsecase>(
        () => LoginUsecase(_sl<BaseAuthRepository>()),
      );
    }

    /// repository
    if (!isRegistered<BaseAuthRepository>()) {
      _sl.registerLazySingleton<BaseAuthRepository>(
        () => AuthRepositoryImpl(
          _sl<ErrorHandler>(),
          _sl<NetworkInfo>(),
          _sl<BaseAuthRemoteDatasource>(),
        ),
      );
    }

    /// remote datasource
    if (!isRegistered<BaseAuthRemoteDatasource>()) {
      _sl.registerLazySingleton<BaseAuthRemoteDatasource>(
        () => AuthRemoteDatasourceImpl(_sl<ApiManager>()),
      );
    }
  }

  /// initiate register module
  static void initRegisterModule() {
    /// bloc
    if (!isRegistered<RegisterScreenBloc>()) {
      _sl.registerFactory<RegisterScreenBloc>(
        () => RegisterScreenBloc(
          _sl<Session>(),
          _sl<Validator>(),
          _sl<RegisterUsecase>(),
        ),
      );
    }

    /// usecase
    if (!isRegistered<RegisterUsecase>()) {
      _sl.registerLazySingleton<RegisterUsecase>(
          () => RegisterUsecase(_sl<BaseAuthRepository>()));
    }

    /// repository

    if (!isRegistered<BaseAuthRepository>()) {
      _sl.registerLazySingleton<BaseAuthRepository>(
        () => AuthRepositoryImpl(
          _sl<ErrorHandler>(),
          _sl<NetworkInfo>(),
          _sl<BaseAuthRemoteDatasource>(),
        ),
      );
    }

    /// remote datasource
    if (!isRegistered<BaseAuthRemoteDatasource>()) {
      _sl.registerLazySingleton<BaseAuthRemoteDatasource>(
          () => AuthRemoteDatasourceImpl(_sl<ApiManager>()));
    }
  }

  /// initiate language module
  static void initLanguageModule() {
    /// bloc
    if (!isRegistered<LanguageScreenBloc>()) {
      _sl.registerFactory<LanguageScreenBloc>(
          () => LanguageScreenBloc(_sl<AppPrefs>()));
    }
  }

  /// initiate theme module
  static void initThemeModule() {
    /// bloc
    if (!isRegistered<ThemeScreenBloc>()) {
      _sl.registerFactory<ThemeScreenBloc>(
          () => ThemeScreenBloc(_sl<AppPrefs>()));
    }
  }
}
