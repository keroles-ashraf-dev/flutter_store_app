import '../../domain/entity/filter.dart';
import '../model/filter_model.dart';

extension FilterModelMapper on FilterModel {
  Filter get toEntity {
    return Filter(
      sortBy: sortBy,
      orderBy: orderBy,
    );
  }
}

extension FilterMapper on Filter {
  FilterModel get toModel {
    return FilterModel(
      sortBy: sortBy,
      orderBy: orderBy,
    );
  }
}
