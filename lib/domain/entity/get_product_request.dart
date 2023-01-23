import 'package:equatable/equatable.dart';

import '../../core/util/app_constant.dart';

class GetProductRequest extends Equatable {
  final int id;

  const GetProductRequest({
    required this.id,
  });

  /// return empty object
  const GetProductRequest.empty({
    this.id = AppConstant.emptyInt,
  });

  @override
  List<Object> get props => [
        id,
      ];
}
