import 'package:equatable/equatable.dart';

import '../../app/util/app_constant.dart';

class GetCartRequest extends Equatable {
  final int userId;

  const GetCartRequest({
    required this.userId,
  });

  /// return empty object
  const GetCartRequest.empty({
    this.userId = AppConstant.emptyInt,
  });

  @override
  List<Object> get props => [
        userId,
      ];
}
