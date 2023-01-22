import 'package:equatable/equatable.dart';
import 'package:store/core/util/app_constant.dart';

abstract class Failure extends Equatable {
  final String message;
  final int code;

  const Failure(this.message, {this.code = AppConstant.zeroInt});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.code});
}

class LocalFailure extends Failure {
  const LocalFailure(super.message, {super.code});
}

class CacheFailure extends Failure {
  const CacheFailure(super.message, {super.code});
}
