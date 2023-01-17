import 'package:equatable/equatable.dart';

import '../../app/util/app_constant.dart';

class GetDealRequest extends Equatable {
  final int id;

  const GetDealRequest({
    required this.id,
  });

  /// return empty object
  const GetDealRequest.empty({
    this.id = AppConstant.emptyInt,
  });

  @override
  List<Object> get props => [
        id,
      ];
}
