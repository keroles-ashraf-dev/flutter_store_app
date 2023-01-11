class ApiConstant {
  static const String apiKey = '654gnh6???f4h664g41jy54hj0++-*/8995+6+5596';
  static const int apiTimeOut = 30000; // 5 min
 
  /// header
  static const String headerContentTypeKey = 'content-type';
  static const String headerAcceptKey = 'accept';
  static const String headerApiKey = 'api-key';
  static const String headerAuthorizationKey = 'authorization';
  static const String headerValueApplicationJson = 'application/json';

  /// response
  static const String resStatusKey = 'success';
  static const int resStatusSuccess = 1;
  static const int resStatusFailure = 0;
  static const String resMsgKey = 'message';
  static const String resDataKey = 'data';
  static const String resDataCarouselKey = 'carousel';
  static const String resDataCategoriesKey = 'categories';
  static const String resDataDealsKey = 'deals';
  static const String resDataDealKey = 'deal';
  static const String resDataUserKey = 'user';
  static const String resDataAddressKey = 'address';
  static const String resDataAddressesKey = 'addresses';
  static const String resDataCountryKey = 'country';

  /// base url
  //static const String baseUrl = 'https://top-store.lxvll.com';
  static const String baseUrl = 'http://192.168.1.5/top-store';

  /// auth uri
  static const String loginUri = '/api/v1/login';
  static const String registerUri = '/api/v1/register';

  /// user uri
  static const String userDataUri = '/api/v1/user';

  /// deal uri
  static const String dealsUri = '/api/v1/deals';
  static const String dealUri = '/api/v1/deal';

  /// address uri
  static const String addressesUri = '/api/v1/addresses';
  static const String addressUri = '/api/v1/address';

  /// category uri
  static const String mainCategoriesUri = '/api/v1/parents-categories';

  /// carousel uri
  static const String mainCarouselUri = '/api/v1/main-carousel';
}
