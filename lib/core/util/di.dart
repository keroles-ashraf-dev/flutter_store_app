import 'package:get_it/get_it.dart';
import 'package:store/core/cache/cache_manager.dart';
import 'package:store/core/error/error_handling.dart';
import 'package:store/core/network/api_manager.dart';
import 'package:store/core/network/network_info.dart';
import 'package:store/core/util/app_prefs.dart';
import 'package:store/core/util/validator.dart';
import 'package:store/data/datasource/remote/user_remote_datasource.dart';
import 'package:store/domain/repository/base_user_repository.dart';
import 'package:store/domain/usecase/auth/login_usecase.dart';
import 'package:store/domain/usecase/auth/register_usecase.dart';
import 'package:store/domain/usecase/category/get_main_categories_usecase.dart';
import 'package:store/domain/usecase/user/get_user_data_usecase.dart';
import 'package:store/presentation/home/controller/home_screen_bloc.dart';
import 'package:store/presentation/login/controller/login_screen_bloc.dart';
import 'package:store/presentation/register/controller/register_screen_bloc.dart';
import 'package:store/presentation/splash/controller/initial_screen_bloc.dart';
import 'package:store/presentation/theme/controller/theme_screen_bloc.dart';

import '../../data/datasource/local/carousel_local_datasource.dart';
import '../../data/datasource/local/category_local_datasource.dart';
import '../../data/datasource/local/deal_local_datasource.dart';
import '../../data/datasource/local/product_local_datasource.dart';
import '../../data/datasource/remote/auth_remote_datasource.dart';
import '../../data/datasource/remote/carousel_remote_datasource.dart';
import '../../data/datasource/remote/category_remote_datasource.dart';
import '../../data/datasource/remote/deal_remote_datasource.dart';
import '../../data/datasource/remote/product_remote_datasource.dart';
import '../../data/repository/auth_repository_impl.dart';
import '../../data/repository/carousel_repository_impl.dart';
import '../../data/repository/category_repository_impl.dart';
import '../../data/repository/deal_repository_impl.dart';
import '../../data/repository/product_repository_impl.dart';
import '../../data/repository/user_repository_impl.dart';
import '../../domain/repository/base_auth_repository.dart';
import '../../domain/repository/base_carousel_repository.dart';
import '../../domain/repository/base_category_repository.dart';
import '../../domain/repository/base_deal_repository.dart';
import '../../domain/repository/base_product_repository.dart';
import '../../domain/usecase/carousel/get_main_carousel_usecase.dart';
import '../../domain/usecase/deal/get_deals_usecase.dart';
import '../../presentation/language/controller/language_screen_bloc.dart';
import '../../presentation/main/controller/main_screen_bloc.dart';

final di = GetIt.instance;

void initDI() {
  /// core
  di.registerLazySingleton<AppPrefs>(() => AppPrefs());
  di.registerLazySingleton<NetworkInfo>(() => NetworkInfo());
  di.registerLazySingleton<Validator>(() => Validator());
  di.registerLazySingleton<ErrorHandler>(() => ErrorHandler());
  di.registerLazySingleton<CacheManager>(() => CacheManager());
  di.registerLazySingleton<ApiManager>(() => ApiManager(di<AppPrefs>(), di<ErrorHandler>()));

  /// bloc
  di.registerFactory<InitialScreenBloc>(
      () => InitialScreenBloc(di<AppPrefs>(), di<GetUserDataUsecase>()));
  di.registerFactory<MainScreenBloc>(() => MainScreenBloc());
  di.registerFactory<LoginScreenBloc>(
      () => LoginScreenBloc(di<AppPrefs>(), di<LoginUsecase>()));
  di.registerFactory<RegisterScreenBloc>(
      () => RegisterScreenBloc(di<AppPrefs>(), di<RegisterUsecase>()));
  di.registerFactory<HomeScreenBloc>(
    () => HomeScreenBloc(di<GetMainCarouselUsecase>(),
        di<GetMainCategoriesUsecase>(), di<GetDealsUsecase>()),
  );
  di.registerFactory<ThemeScreenBloc>(() => ThemeScreenBloc());
  di.registerFactory<LanguageScreenBloc>(() => LanguageScreenBloc());

  /// usecase
  di.registerLazySingleton<GetUserDataUsecase>(
      () => GetUserDataUsecase(di<BaseUserRepository>()));
  di.registerLazySingleton<LoginUsecase>(
      () => LoginUsecase(di<BaseAuthRepository>()));
  di.registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(di<BaseAuthRepository>()));
  di.registerLazySingleton<GetDealsUsecase>(
      () => GetDealsUsecase(di<BaseDealRepository>()));
  di.registerLazySingleton<GetMainCategoriesUsecase>(
      () => GetMainCategoriesUsecase(di<BaseCategoryRepository>()));
  di.registerLazySingleton<GetMainCarouselUsecase>(
      () => GetMainCarouselUsecase(di<BaseCarouselRepository>()));

  /// repository
  di.registerLazySingleton<BaseUserRepository>(() => UserRepositoryImpl(
      di<ErrorHandler>(), di<NetworkInfo>(), di<BaseUserRemoteDatasource>()));
  di.registerLazySingleton<BaseAuthRepository>(() => AuthRepositoryImpl(
      di<ErrorHandler>(), di<NetworkInfo>(), di<BaseAuthRemoteDatasource>()));
  di.registerLazySingleton<BaseProductRepository>(() => ProductRepositoryImpl(
      di<ErrorHandler>(),
      di<NetworkInfo>(),
      di<BaseProductLocalDatasource>(),
      di<BaseProductRemoteDatasource>()));
  di.registerLazySingleton<BaseDealRepository>(() => DealRepositoryImpl(
      di<ErrorHandler>(),
      di<NetworkInfo>(),
      di<BaseDealLocalDatasource>(),
      di<BaseDealRemoteDatasource>()));
  di.registerLazySingleton<BaseCategoryRepository>(() => CategoryRepositoryImpl(
      di<ErrorHandler>(),
      di<NetworkInfo>(),
      di<BaseCategoryLocalDatasource>(),
      di<BaseCategoryRemoteDatasource>()));
  di.registerLazySingleton<BaseCarouselRepository>(() => CarouselRepositoryImpl(
      di<ErrorHandler>(),
      di<NetworkInfo>(),
      di<BaseCarouselLocalDatasource>(),
      di<BaseCarouselRemoteDatasource>()));

  /// remote datasource
  di.registerLazySingleton<BaseUserRemoteDatasource>(
      () => UserRemoteDatasourceImpl(di<ApiManager>()));
  di.registerLazySingleton<BaseAuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(di<ApiManager>()));
  di.registerLazySingleton<BaseProductRemoteDatasource>(
      () => ProductRemoteDatasourceImpl(di<ApiManager>()));
  di.registerLazySingleton<BaseDealRemoteDatasource>(
      () => DealRemoteDatasourceImpl(di<ApiManager>()));
  di.registerLazySingleton<BaseCategoryRemoteDatasource>(
      () => CategoryRemoteDatasourceImpl(di<ApiManager>()));
  di.registerLazySingleton<BaseCarouselRemoteDatasource>(
      () => CarouselRemoteDatasourceImpl(di<ApiManager>()));

  /// local datasource
  di.registerLazySingleton<BaseProductLocalDatasource>(
      () => ProductLocalDatasourceImpl(di<ErrorHandler>(), di<CacheManager>()));
  di.registerLazySingleton<BaseDealLocalDatasource>(
      () => DealLocalDatasourceImpl(di<ErrorHandler>(), di<CacheManager>()));
  di.registerLazySingleton<BaseCategoryLocalDatasource>(() =>
      CategoryLocalDatasourceImpl(di<ErrorHandler>(), di<CacheManager>()));
  di.registerLazySingleton<BaseCarouselLocalDatasource>(() =>
      CarouselLocalDatasourceImpl(di<ErrorHandler>(), di<CacheManager>()));
}
