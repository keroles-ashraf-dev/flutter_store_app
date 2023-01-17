class CacheConstant {
  static const String cacheSubDir = '/appCache';
  static const String boxName = 'hiveCache';
  static const int cacheValidSeconds = 5 * 60; // 5 min

  ///deal
  static const String dealsDataKey = 'deals_data';
  static const String dealsCreatedKey = 'deals_created';

  ///default address
  static const String defaultAddressDataKey = 'default_address_data';
  static const String defaultAddressCreatedKey = 'default_address_created';

  ///category
  static const String mainCategoriesDataKey = 'main_categories_data';
  static const String mainCategoriesCreatedKey = 'main_categories_created';

  ///carousel
  static const String mainCarouselDataKey = 'main_carousel_data';
  static const String mainCarouselCreatedKey = 'main_carousel_created';
}
