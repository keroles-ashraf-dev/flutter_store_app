import 'package:equatable/equatable.dart';

/// used for BaseUsecase extenders which don't need to pass params
class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object> get props => [];
}
