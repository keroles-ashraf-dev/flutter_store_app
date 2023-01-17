import 'package:equatable/equatable.dart';

import '../../app/util/app_constant.dart';

class GetAddressRequest extends Equatable {
  final int id;

  const GetAddressRequest({
    required this.id,
  });

  /// return empty object
  const GetAddressRequest.empty({
    this.id = AppConstant.emptyInt,
  });

  @override
  List<Object> get props => [
        id,
      ];
}
